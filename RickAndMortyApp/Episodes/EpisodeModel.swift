//
//  EpisodeModel.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 29.05.2022.
//

import Apollo
import Foundation

public struct EpisodeResponseDTO {
  public let info: Info
  public let results: [Episode]

  public struct Info {
    public let count: Int?
    public let pages: Int?
    public let next: Int?
    public let prev: Int?
  }

  public struct Episode {
    public let id: GraphQLID
    public let name: String?
    public let airDate: String?
    public let episode: String?
    public let characters: [Character]!
    public let created: String?
  }

  public struct Character {
    public let id: GraphQLID
    public let name: String?
    public let image: String?
  }
}
