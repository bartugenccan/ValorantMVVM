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
    
    var selectedAgent: SingleAgentViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let imageUrl = URL(string: selectedAgent!.agentPortrait)!
        let data = try? Data(contentsOf: imageUrl)
        if let imageData = data {
            let image = UIImage(data: imageData)
            imageView.image = image!
        }
        
        charNameLabel.text = selectedAgent?.agentName
        charDescriptionLabel.text = selectedAgent?.agentDescription
    }
    
   
    @IBAction func addButtonClicked(_ sender: Any) {
        if FavoritesViewController.favoriteAgents.contains(where: {$0.agentName == selectedAgent?.agentName}) {
            let alert = UIAlertController(title: "Error", message: "Agent Already In Favorites", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else {
            FavoritesViewController.favoriteAgents.append(selectedAgent!)
        }
    }
}
