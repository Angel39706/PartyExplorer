//
//  PartyCardView.swift
//  PartyExplorer
//
//  Created by Angel Martinez on 12/3/23.
//

import SwiftUI

struct PartyCardView: View {
    let party: PartyModel
    @State private var image: UIImage? // State variable to hold the fetched image
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(party.name)
                .font(.headline)
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
            } else {
                Text("Loading Image...")
            }
            
            Text("Price: \(party.formattedPrice)")
            Text("Start Date: \(formatDate(party.startDate))")
            
            if let endDate = party.endDate {
                Text("End Date: \(formatDate(endDate))")
                    .foregroundStyle(.red.opacity(0.5))
                
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .shadow(radius: 4)
        .onAppear {
            loadImage(from: party.bannerImageURL)
        }
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = uiImage
                }
            }
        }.resume()
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
}

#Preview {
    let previewParty = PartyModel (name: "sample", bannerImageURL: (URL(string: "https://t4.ftcdn.net/jpg/01/20/28/25/360_F_120282530_gMCruc8XX2mwf5YtODLV2O1TGHzu4CAb.jpg") ?? URL(string:""))!, price: 25.0, startDate: Date(), endDate: nil)
    
    return PartyCardView(party: previewParty)
}
