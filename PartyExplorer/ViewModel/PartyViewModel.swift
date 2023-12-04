//
//  PartyViewModel.swift
//  PartyExplorer
//
//  Created by Angel Martinez on 12/3/23.
//

import Foundation

class PartyViewModel: ObservableObject {
    @Published var parties: [PartyModel] = [] // Your array of parties
    
    // Fetch 3 random parties when initializing the ViewModel
    init() {
        fetchRandomParties(count: 3)
    }
    
    func fetchRandomParties(count: Int) {
        let randomParties = PartyModel.randomParty(count: count) // Generate random parties
        parties.append(contentsOf: randomParties) // Add the random parties to the list
    }
    
    func filteredParties(searchText: String) -> [PartyModel] {
        if searchText.isEmpty {
            return parties
        } else {
            return parties.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func addRandomParty() {
        let newParty = PartyModel.randomParty(count: 1).first
        if let newParty = newParty {
            parties.insert(newParty, at: 0)
        }
    }
}
