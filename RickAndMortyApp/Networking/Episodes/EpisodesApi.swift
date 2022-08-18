//
//  EpisodesApi.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 8.08.2022.
//

import Foundation

public protocol EpisodesApi {
  func getEpisodes(onComplete: @escaping (Result<EpisodeResponseDTO?, ApiError>) -> Void)
}
