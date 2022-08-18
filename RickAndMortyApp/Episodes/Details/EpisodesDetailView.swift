//
//  EpisodesDetailView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 11.08.2022.
//

import KingfisherSwiftUI
import SwiftUI

struct EpisodesDetailView: View {
  let episode: EpisodeResponseDTO.Episode
  var body: some View {
    List {
      Section(header: Text("INFO")) {
        InfoRowView(label: "Name", icon: "info", value: episode.name ?? "")
        InfoRowView(label: "Air Date", icon: "calendar", value: episode.airDate ?? "")
        InfoRowView(label: "Episode", icon: "barcode.viewfinder", value: episode.episode ?? "")
      }
      Section(header: Text("CHARACTERS")) {
        ForEach(episode.characters, id: \.id) { item in
          HStack {
            if let image = item.image ?? "",
               let url = URL(string: image) {
              KFImage(url)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
                .cornerRadius(25)
            } else {
              RoundedRectangle(cornerRadius: 25)
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            }
            VStack(alignment: .leading) {
              Text(item.name ?? "")
                .font(.body)
                .foregroundColor(.black)
                .redacted(reason: item.name == nil ? .placeholder : [])
            }
          }
        }
      }
    }
  }
}

// struct EpisodesDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodesDetailView()
//    }
// }
