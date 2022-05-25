//
//  TabbarView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 23.05.2022.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            CharactersList()
                .tabItem {
                    Label("Characters", systemImage: "person.3")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
        .accentColor(.green)
    }
    
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
