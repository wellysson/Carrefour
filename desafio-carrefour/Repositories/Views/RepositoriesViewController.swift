//
//  RepositoriesViewController.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import UIKit

class RepositoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: RepositoriesViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel?.delegate = self
        self.viewModel?.fetchRepository()
        
        self.setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RepositoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoriesTableViewCell")
    }

}

extension RepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.repositories?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesTableViewCell", for: indexPath) as! RepositoriesTableViewCell
        if let repositoryViewModel = self.viewModel?.repositories?[indexPath.row] {
            cell.configure(with: repositoryViewModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let repository = self.viewModel?.repositories?[indexPath.row] {
            guard let url = repository.htmlUrl else { return }
            self.viewModel?.navigateToRepository(url: url)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension RepositoriesViewController: RepositoriesViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
