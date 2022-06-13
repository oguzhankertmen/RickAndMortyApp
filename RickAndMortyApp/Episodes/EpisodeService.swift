//
//  EpisodeService.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 30.05.2022.
//

import Foundation

class EpisodeService: ObservableObject {

  @Published var episodes: [EpisodeModel] = []

  func fetchEpisodes() {

    Network.shared.apollo.fetch(query: GetEpisodesQuery()) { [weak self] result in
      switch result {
        case .success(let graphQLResult):
          if let episode = graphQLResult.data?.episodes?.results {
            self?.episodes = episode.map {EpisodeModel(result: $0)}

          }
        case .failure(let error):
          print("Error: \(error)")

      }
    }

  }

  init() {
    fetchEpisodes()
  }
}
