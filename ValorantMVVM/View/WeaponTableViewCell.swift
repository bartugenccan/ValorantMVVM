//
//  WeaponTableViewCell.swift
//  ValorantMVVM
//
//  Created by Bartu Gençcan on 25.08.2022.
//

import UIKit

class WeaponTableViewCell: UITableViewCell {

    @IBOutlet weak var weaponImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
