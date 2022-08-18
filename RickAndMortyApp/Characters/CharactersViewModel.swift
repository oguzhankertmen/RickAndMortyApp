//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 5.08.2022.
//

import Foundation

class CharactersViewModel: ObservableObject {
  @Published var charactersArray: [CharacterResponseDTO.Character] = []

  let charactersService: CharactersApi

  init(charactersApi: CharactersApi) {
    self.charactersService = charactersApi
  }

  func getCharacters() {
    self.charactersService.getCharacters { result in
      switch result {
      case let .success(charactersArray):
        if let charactersArray = charactersArray {
          DispatchQueue.main.async {
            self.charactersArray = charactersArray.results
          }
        }

      case let .failure(error):
        print(error.localizedDescription)
      }
    }
  }
}
