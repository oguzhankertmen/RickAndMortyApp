//
//  EpisodesService.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 8.08.2022.
//

import Foundation

public class EpisodesService: EpisodesApi {
  public func getEpisodes(onComplete: @escaping (Result<EpisodeResponseDTO?, ApiError>) -> Void) {
    Network.shared.apollo.fetch(query: GetEpisodesQuery()) { result in
      switch result {
      case let .success(graphQLResult):
        let data = graphQLResult.data
        let episodes: [GetEpisodesQuery.Data.Episode.Result] = (data?.episodes?.results?.compactMap { $0 })!
        let mappedEpisodes = episodes.map { episode in
          EpisodeResponseDTO.Episode(
            id: episode.id ?? "",
            name: episode.name ?? "",
            airDate: episode.airDate ?? "",
            episode: episode.episode ?? "",
            characters: episode.characters.map { item in
              EpisodeResponseDTO.Character(
                id: item?.id ?? "",
                name: item?.name ?? "",
                image: item?.image ?? ""
              )
            },
            created: episode.created ?? ""
          )
        }

        let responseDTO = EpisodeResponseDTO(
          info: EpisodeResponseDTO.Info(
            count: data?.episodes?.info?.count ?? nil,
            pages: data?.episodes?.info?.pages ?? nil,
            next: data?.episodes?.info?.next ?? nil,
            prev: data?.episodes?.info?.prev ?? nil
          ),
          results: mappedEpisodes
        )

        onComplete(.success(responseDTO))

      case let .failure(error):
        print(error.localizedDescription)
        onComplete(.failure(.dataNotArrived))
      }
    }
  }
}
