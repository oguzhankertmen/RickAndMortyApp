//
//  CharacterModel.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 13.05.2022.
//

import Foundation

struct CharacterModel {

  var name: String
  var species: String
  var gender: String
  var status: String
  var image: String

  init(result: FetchAllCharactersQuery.Data.Character.Result?) {

    name = result?.name ?? "-"
    species = result?.species ?? "-"
    gender = result?.gender ?? "-"
    status = result?.status ?? "-"
    image = result?.image ?? "-"

  }
}
