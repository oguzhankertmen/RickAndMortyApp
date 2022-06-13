//
//  EpisodeListView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 23.05.2022.
//

import SwiftUI

struct EpisodeListView: View {
  @StateObject var viewModel = EpisodeService()

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.episodes, id: \.name) { episode in
          EpisodeListRowView(episode: episode)
        }
      }.listStyle(PlainListStyle())
        .navigationBarTitle("Episodes")
    }
  }
}

struct EpisodeListView_Previews: PreviewProvider {
  static var previews: some View {
    EpisodeListView()
  }
}
