//
//  AgentViewModel.swift
//  ValorantMVVM
//
//  Created by Bartu Gençcan on 22.08.2022.
//

import Foundation

struct AgentViewModel {
    let agents: Agents
}

extension AgentViewModel {
    
    func numberOfRows() -> Int{
        return self.agents.data.count
    }
    
    func agentAtIndex(_ index:Int) -> SingleAgentViewModel {
        let agent = self.agents.data[index]
        return SingleAgentViewModel(singleAgent: agent)
    }
    
}

struct SingleAgentViewModel {
    let singleAgent: Agent
    
    var agentImage: String {
        return self.singleAgent.displayIcon
    }
    
    var agentName: String {
        return self.singleAgent.displayName
    }
    
    var agentColors: [String] {
        return self.singleAgent.backgroundGradientColors
    }
}
