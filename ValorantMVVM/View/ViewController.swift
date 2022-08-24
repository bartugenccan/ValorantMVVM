//
//  ViewController.swift
//  ValorantMVVM
//
//  Created by Bartu Gençcan on 21.08.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var agentViewModel: AgentViewModel!
    
    var chosenAgent: SingleAgentViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
        
    }
    
    func getData(){
        
        let url = URL(string: "https://valorant-api.com/v1/agents?isPlayableCharacter=true")!
        
        WebService().fetchAgents(url: url) { agents in
            if let agents = agents {
                self.agentViewModel = AgentViewModel(agents: agents)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.agentViewModel == nil ? 0 : self.agentViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ValorantInfo", for: indexPath) as! ValorantTableViewCell
        
        let singleAgentViewModel = self.agentViewModel.agentAtIndex(indexPath.row)
        let imageUrl = URL(string: singleAgentViewModel.agentImage)

        
        cell.agentImage.kf.setImage(with: imageUrl)
        cell.agentImage.layer.masksToBounds = true
        
        cell.agentLabel.text = singleAgentViewModel.agentName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenAgent = agentViewModel.agentAtIndex(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toAgentDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAgentDetail" {
            let destinationVC = segue.destination as! AgentDetailViewController
            
            let imageUrl = URL(string: chosenAgent!.agentPortrait)!
            let data = try? Data(contentsOf: imageUrl)
            
            
            
            destinationVC.selectedAgentName = chosenAgent!.agentName
            if let imageData = data {
                let image = UIImage(data: imageData)
                destinationVC.selectedAgentImage = image!
            }
            destinationVC.selectedAgentDescription = chosenAgent!.agentDescription
        }
    }
}

