//
//  WeaponViewModel.swift
//  ValorantMVVM
//
//  Created by Bartu Gençcan on 25.08.2022.
//

import Foundation

struct WeaponViewModel {
    let weapons: Weapons
}

extension WeaponViewModel {
    
    func numberOfRows() -> Int {
        return self.weapons.data.count
    }
    
    func weaponAtIndex(_ index:Int) -> SingleWeaponViewModel {
        let weapon = self.weapons.data[index]
        return SingleWeaponViewModel(singleWeapon: weapon)
    }
}

struct SingleWeaponViewModel {
    let singleWeapon: Weapon
    
    var weaponName: String {
        return self.singleWeapon.displayName
    }
    
    var weaponImage:String {
        return self.singleWeapon.displayIcon
    }
}
