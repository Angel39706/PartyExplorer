//
//  PartyListView.swift
//  PartyExplorer
//
//  Created by Angel Martinez on 12/3/23.
//

import SwiftUI

struct PartyListView: View {
    @ObservedObject var viewModel: PartyViewModel
    @State private var searchText = ""
    
    
    var body: some View {
        VStack{
            HStack{
                SearchBar(searchText:  $searchText)
                Button(action: {
                    viewModel.addRandomParty()
                }) {
                    Image(systemName: "plus.magnifyingglass")
                        .font(.title)
                }
                .padding(.trailing, 8)
            }
            List {
                ForEach(viewModel.filteredParties(searchText: searchText)) { party in
                    PartyCardView(party: party)}
            }
            .listStyle(.plain)
        }
        
    }
}

#Preview {
    PartyListView(viewModel: PartyViewModel.init())
}
