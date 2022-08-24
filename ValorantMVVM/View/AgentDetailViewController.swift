//
//  AgentDetailViewController.swift
//  ValorantMVVM
//
//  Created by Bartu Gençcan on 24.08.2022.
//

import UIKit

class AgentDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var charNameLabel: UILabel!
    @IBOutlet weak var charDescriptionLabel: UILabel!
    
    var selectedAgentImage = UIImage()
    var selectedAgentName = ""
    var selectedAgentDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = selectedAgentImage
        charNameLabel.text = selectedAgentName
        charDescriptionLabel.text = selectedAgentDescription
    }
    
}
