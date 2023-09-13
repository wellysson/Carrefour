//
//  HomeTableViewCell.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with viewModel: UserViewModel) {
        loginLabel.text = viewModel.login
        if let avatarURL = viewModel.avatarUrl {
            self.avatarImageView.sd_setImage(with: viewModel.avatarUrl)
        } else {
            // Defina uma imagem padrão se avatarURL for nulo
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.containerView.backgroundColor = selected ? UIColor(rgba: "#EEEEEE") : UIColor(rgba: "#FFFFFF")
        
    }
    
    override func prepareForReuse() {
        self.avatarImageView.image = nil
        self.loginLabel.text = nil
    }
    
}
