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
      CharacterListView().tag(0)
        .tabItem {
          Label("Characters", systemImage: "person.2.crop.square.stack")
        }
      EpisodeListView().tag(1)
        .tabItem {
          Label("Episodes", systemImage: "play.rectangle")
        }
      LocationsListView().tag(3)
        .tabItem {
          Label("Locations", systemImage: "map")
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
