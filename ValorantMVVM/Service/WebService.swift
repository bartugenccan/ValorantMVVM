//
//  WebService.swift
//  ValorantMVVM
//
//  Created by Bartu Gençcan on 22.08.2022.
//

import Foundation

class WebService {
    
    func fetchAgents(url: URL, completion: @escaping (Agents?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let agentList = try? JSONDecoder().decode(Agents.self, from: data)
                
                if let agentList = agentList {
                    completion(agentList)
                }
            }
        }.resume()
    }
    
}
