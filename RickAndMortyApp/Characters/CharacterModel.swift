//
//  CharacterModel.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 13.05.2022.
//

import Apollo
import Foundation

public struct CharacterResponseDTO {
  public let info: Info
  public let results: [Character]

  public struct Info {
    public let count: Int?
    public let pages: Int?
    public let next: Int?
    public let prev: Int?
  }

  public struct Character {
    public let id: GraphQLID
    public let name: String?
    public let status: String?
    public let species: String?

    public let gender: String?
    public let origin: Origin
    public let location: Location
    public let image: String?
    public let episode: [Episode]!
    public let created: String?
  }

  public struct Origin {
    public let id: GraphQLID
    public let name: String?
    public let dimension: String?
  }

  public struct Location {
    public let id: GraphQLID
    public let name: String?
    public let dimension: String?
  }

  public struct Episode {
    public let id: GraphQLID
    public let name: String?
    public let airDate: String?
    public let episode: String?
  }
}
