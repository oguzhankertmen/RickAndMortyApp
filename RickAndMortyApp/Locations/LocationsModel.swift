//
//  LocationsModel.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 10.08.2022.
//

import Apollo
import Foundation

public struct LocationsResponseDTO {
  public let info: Info
  public let results: [Location]

  public struct Info {
    public let count: Int?
    public let pages: Int?
    public let next: Int?
    public let prev: Int?
  }

  public struct Location {
    let id: GraphQLID
    let name: String
    let dimension: String
    let residents: [Character]!
    let created: String
  }

  public struct Character {
    public let id: GraphQLID
    public let name: String?
    public let image: String?
  }
}
