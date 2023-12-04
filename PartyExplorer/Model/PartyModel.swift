//
//  PartyModel.swift
//  PartyExplorer
//
//  Created by Angel Martinez on 12/3/23.
//

import Foundation

struct PartyModel: Identifiable {
    let id = UUID()
    let name: String
    let bannerImageURL: URL
    let price: Double
    let startDate: Date
    let endDate: Date?
    
    var formattedPrice: String {
        String(format: "$%.2f", price)
    }
    
    static func randomParty(count: Int) -> [PartyModel] {
        var parties: [PartyModel] = []
        let partyName = ["Party One", "Party Two", "Party Three", "Party Four", "Party Five"]
        let bannerImageURLs = [
            "https://t4.ftcdn.net/jpg/01/20/28/25/360_F_120282530_gMCruc8XX2mwf5YtODLV2O1TGHzu4CAb.jpg",
            "https://t3.ftcdn.net/jpg/02/87/35/70/360_F_287357045_Ib0oYOxhotdjOEHi0vkggpZTQCsz0r19.jpg",
            "https://merrimacknewspaper.com/wp-content/uploads/2022/02/ib6knutlr8ny0qtfutkjbw7nrmozyjvyklapi0aam-nw4p9pwxglsn5y3zneptzyglefjn9tmcj8srwtqdyr1y9rtz8wvdhl-dhlgbxndofyyv_opqnl3sjez1mwzegmp.png",
            "https://t4.ftcdn.net/jpg/01/99/21/01/360_F_199210113_PO4I2F3CAfEhCnVnWNveK9mlgWyxY8jn.jpg"
        ]
        
        for _ in 0..<count {
            let randomName = partyName.randomElement() ?? "Random Party"
            let randomImageURLString = bannerImageURLs.randomElement() ?? ""
            guard let randomImageURL = URL(string: randomImageURLString) else { continue }
            let randomPrice = Double.random(in: 10.0...100.0)
            let randomStartDate = Date().addingTimeInterval(TimeInterval.random(in: 0...(60*60*24*30)))
            let randomEndDate = Bool.random() ? nil : randomStartDate.addingTimeInterval(TimeInterval.random(in: 0...(60 * 60 * 24 * 7)))
            
            let party = PartyModel(name: randomName, bannerImageURL: randomImageURL, price: randomPrice, startDate: randomStartDate, endDate: randomEndDate)
            parties.append(party)
        }
        
        return parties
    }
}

