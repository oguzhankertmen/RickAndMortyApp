//
//  EpisodeListView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 23.05.2022.
//

import SwiftUI

struct EpisodeListView: View {
  @ObservedObject var viewModel = EpisodesViewModel(episodesApi: EpisodesService())

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.episodesArray, id: \.id) { episode in
          NavigationLink(
            destination: EpisodesDetailView(episode: episode),
            label: {
              EpisodeListRowView(episode: episode)
            }
          )
        }
      }.listStyle(PlainListStyle())
        .navigationBarTitle("Episodes")
    }.onAppear(perform: viewModel.getEpisodes)
  }
}

struct EpisodeListView_Previews: PreviewProvider {
  static var previews: some View {
    EpisodeListView()
  }
}
