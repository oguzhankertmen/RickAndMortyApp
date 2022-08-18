//
//  CharacterApi.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 5.08.2022.
//

import Foundation

public protocol CharactersApi {
  func getCharacters(onComplete: @escaping (Result<CharacterResponseDTO?, ApiError>) -> Void)
}
