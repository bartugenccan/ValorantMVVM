//
//  ValorantTableViewCell.swift
//  ValorantMVVM
//
//  Created by Bartu Gençcan on 21.08.2022.
//

import UIKit

class ValorantTableViewCell: UITableViewCell {

    @IBOutlet weak var agentImage: UIImageView!
    @IBOutlet weak var agentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
