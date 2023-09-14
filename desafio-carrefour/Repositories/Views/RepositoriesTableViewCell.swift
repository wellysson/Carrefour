//
//  RepositoriesTableViewCell.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 13/09/23.
//

import UIKit

class RepositoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with repository: RepositoryViewModel) {
        self.nameLabel.text = repository.name
        self.descriptionLabel.text = repository.description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.containerView.backgroundColor = selected ? UIColor(rgba: "#EEEEEE") : UIColor(rgba: "#FFFFFF")
    }
    
    override func prepareForReuse() {
        self.nameLabel.text = nil
        self.descriptionLabel.text = nil
    }
}
