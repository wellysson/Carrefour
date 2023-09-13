//
//  UserDetailViewController.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import UIKit
import SDWebImage

class UserDetailViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var twitterLabel: UILabel!
    @IBOutlet weak var repoCountLabel: UILabel!
    @IBOutlet weak var folowersLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    var viewModel: UserDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel?.delegate = self
        self.viewModel?.fetchUserDetail()
    }
    
    func loadData() {
        self.userImage.sd_setImage(with: self.viewModel?.avatarUrl)
        self.nameLabel.text = self.viewModel?.name
        self.loginLabel.text = self.viewModel?.login
        self.locationLabel.text = self.viewModel?.location
        self.companyLabel.text = self.viewModel?.company
        self.twitterLabel.text = self.viewModel?.twitterUsername
        self.repoCountLabel.text = "\(self.viewModel?.publicRepos ?? 0)"
        self.folowersLabel.text = "\(self.viewModel?.followers ?? 0)"
        self.createdLabel.text = self.viewModel?.createdAt
        self.updatedLabel.text = self.viewModel?.updatedAt
        self.bioLabel.text = self.viewModel?.bio
    }
    
}

extension UserDetailViewController: UserDetailViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.loadData()
        }
    }
}
