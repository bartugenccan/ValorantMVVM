//
//  FavoritesViewController.swift
//  ValorantMVVM
//
//  Created by Bartu Gençcan on 25.08.2022.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    static var favoriteAgents = [SingleAgentViewModel]()
    
    private var agentViewModel: AgentViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            tableView.reloadData()

        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoritesViewController.favoriteAgents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteAgent", for: indexPath) as! FavoriteAgentTableViewCell
        cell.selectionStyle = .none
        
        let imageUrl = URL(string: FavoritesViewController.favoriteAgents[indexPath.row].agentImage)
        cell.agentImageView.kf.setImage(with: imageUrl)
        
        cell.agentLabel.text = FavoritesViewController.favoriteAgents[indexPath.row].agentName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            FavoritesViewController.favoriteAgents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
