//
//  Apollo.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 9.05.2022.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()
  lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
}
