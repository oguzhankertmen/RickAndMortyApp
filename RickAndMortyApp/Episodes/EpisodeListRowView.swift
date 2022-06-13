//
//  EpisodeListRowView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 30.05.2022.
//

import SwiftUI

struct EpisodeListRowView: View {
  let episode: EpisodeModel
  var body: some View {
    HStack(alignment: .center) {
      VStack(alignment: .leading) {
        Text(episode.name )
          .foregroundColor(.black)
      }
      Spacer()
      Text(episode.air_date )
        .foregroundColor(.gray)
        .font(.footnote)
    }.redacted(reason: episode.name == nil ? .placeholder : [])
  }
}

// struct EpisodeListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeListRowView()
//    }
// }
