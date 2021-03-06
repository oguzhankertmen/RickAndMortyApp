//
//  Service.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 30.05.2022.
//

import Foundation

class CharacterService: ObservableObject {

  @Published var characters: [CharacterModel] = []

  func fetchCharacters() {

    Network.shared.apollo.fetch(query: FetchAllCharactersQuery()) { [weak self] result in
      switch result {
        case .success(let graphQLResult):
          if let character = graphQLResult.data?.characters?.results {
            self?.characters = character.map {CharacterModel(result: $0)}

          }
        case .failure(let error):
          print("Error: \(error)")

      }
    }

  }

  init() {
    fetchCharacters()
  }
}
