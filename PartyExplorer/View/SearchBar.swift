//
//  SearchBar.swift
//  PartyExplorer
//
//  Created by Angel Martinez on 12/3/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        TextField("Search", text: $searchText)
            .padding(8)
            .background(Color(.systemGray5))
            .cornerRadius(8)
            .padding(.horizontal, 8)
    }
}

#Preview {
    SearchBar(searchText: .constant("Party One"))
}
