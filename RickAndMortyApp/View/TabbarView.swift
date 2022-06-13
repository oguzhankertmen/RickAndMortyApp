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
      CharacterListView()
        .tabItem {
          Label("Characters", systemImage: "person.2.crop.square.stack")
        }
      EpisodeListView()
        .tabItem {
          Label("Episodes", systemImage: "play.rectangle")
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
