//
//  EpisodesViewModel.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 9.08.2022.
//

import Foundation

class EpisodesViewModel: ObservableObject {
  @Published var episodesArray: [EpisodeResponseDTO.Episode] = []

  let episodesService: EpisodesApi

  init(episodesApi: EpisodesApi) {
    self.episodesService = episodesApi
  }

  func getEpisodes() {
    self.episodesService.getEpisodes { result in
      switch result {
      case let .success(episodesArray):
        if let episodesArray = episodesArray {
          DispatchQueue.main.async {
            self.episodesArray = episodesArray.results
          }
        }

      case let .failure(error):
        print(error.localizedDescription)
      }
    }
  }
}
