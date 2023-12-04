//
//  ContentView.swift
//  PartyExplorer
//
//  Created by Angel Martinez on 12/3/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PartyViewModel()
    
    var body: some View {
        NavigationView{
            PartyListView(viewModel: viewModel)
                .navigationTitle("🥂 Party Explorer 🥂")
        }
    }
}

#Preview {
    ContentView()
}
