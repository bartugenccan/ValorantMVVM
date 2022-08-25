//
//  FavoriteAgentTableViewCell.swift
//  ValorantMVVM
//
//  Created by Bartu Gençcan on 25.08.2022.
//

import UIKit

class FavoriteAgentTableViewCell: UITableViewCell {

    @IBOutlet weak var agentImageView: UIImageView!
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
