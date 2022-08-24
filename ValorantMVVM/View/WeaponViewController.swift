//
//  WeaponViewController.swift
//  ValorantMVVM
//
//  Created by Bartu Gençcan on 25.08.2022.
//

import UIKit

class WeaponViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var weaponViewModel: WeaponViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getData()
    }
    
    func getData() {
        let url = URL(string: "https://valorant-api.com/v1/weapons")!
        
        WebService().fetchWeapons(url: url) { weapons in
            if let weapons = weapons {
                self.weaponViewModel = WeaponViewModel(weapons: weapons)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weaponViewModel == nil ? 0 : self.weaponViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeaponCell", for: indexPath) as! WeaponTableViewCell
        
        let singleWeaponViewModel = self.weaponViewModel.weaponAtIndex(indexPath.row)
        let imageUrl = URL(string: singleWeaponViewModel.weaponImage)

        
        cell.weaponImageView.kf.setImage(with: imageUrl)
        cell.weaponImageView.layer.masksToBounds = true
        
        cell.nameLabel.text = singleWeaponViewModel.weaponName
        
        return cell
    }
   

}
