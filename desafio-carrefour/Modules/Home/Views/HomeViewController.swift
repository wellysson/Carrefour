//
//  HomeViewController.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterTextField: UITextField!

    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel?.delegate = self
        self.viewModel?.fetchUsers()

        self.setupTableView()
        self.filterTextField?.addTarget(self, action: #selector(filterTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func filterTextFieldDidChange(_ textField: UITextField) {
        self.viewModel?.filterByName(name: textField.text ?? "")
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    func updateDataTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.users?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let userViewModel = self.viewModel?.users?[indexPath.row]
        cell.configure(with: userViewModel!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let user = self.viewModel?.users?[indexPath.row] {
            self.viewModel?.navigateToUser(user: user)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate && scrollView.contentOffset.y < 0 {
            self.viewModel?.fetchUsers()
        }
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func reloadData() {
        self.updateDataTable()
    }
}
