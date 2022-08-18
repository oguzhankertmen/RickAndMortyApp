//
//  fetchClient.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 19.07.2022.
//

public final class CharactersService: CharactersApi {
  public func getCharacters(onComplete: @escaping (Result<CharacterResponseDTO?, ApiError>) -> Void) {
    Network.shared.apollo.fetch(query: GetCharactersQuery()) { result in
      switch result {
      case let .success(graphQLResult):
        let data = graphQLResult.data
        let characters: [GetCharactersQuery.Data.Character.Result] = (data?.characters?.results?.compactMap { $0 })!
        let mappedCharacters = characters.map { character in
          CharacterResponseDTO.Character(
            id: character.id ?? "",
            name: character.name ?? "",
            status: character.status ?? "",
            species: character.species ?? "",
            gender: character.gender ?? "",
            origin: CharacterResponseDTO.Origin(
              id: character.origin?.id ?? "",
              name: character.origin?.name ?? "",
              dimension: character.origin?.dimension ?? ""
            ),
            location: CharacterResponseDTO.Location(
              id: character.location?.id ?? "",
              name: character.location?.name ?? "",
              dimension: character.location?.dimension ?? ""
            ),
            image: character.image ?? "",
            episode: character.episode.map { item in
              CharacterResponseDTO.Episode(
                id: item?.id ?? "",
                name: item?.name ?? "",
                airDate: item?.airDate ?? "",
                episode: item?.episode ?? ""
              )
            },
            created: character.created ?? ""
          )
        }
        let responseDTO = CharacterResponseDTO(
          info: CharacterResponseDTO.Info(
            count: data?.characters?.info?.count ?? nil,
            pages: data?.characters?.info?.pages ?? nil,
            next: data?.characters?.info?.next ?? nil,
            prev: data?.characters?.info?.prev ?? nil
          ),
          results: mappedCharacters
        )
        onComplete(.success(responseDTO))

      case let .failure(error):
        print(error.localizedDescription)
        onComplete(.failure(.dataNotArrived))
      }
    }
  }
}

public enum ApiError: Error {
  case wrongUrl
  case dataNotArrived
  case dataNotProcessed
}
