//
//  EpisodeModel.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 29.05.2022.
//

import Foundation

struct EpisodeModel {
  var id: String
  var name: String
  var air_date: String

  init(result: GetEpisodesQuery.Data.Episode.Result?) {
    id = result?.id ?? "-"
    name = result?.name ?? "-"
    air_date = result?.airDate ?? "-"
  }
}
