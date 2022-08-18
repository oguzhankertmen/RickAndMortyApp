//
//  CharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 16.05.2022.
//

import KingfisherSwiftUI
import SwiftUI

struct CharacterDetailView: View {
  let character: CharacterResponseDTO.Character
  var body: some View {
    Text(character.name ?? "").bold()
    List {
      Section(header: Text("PROFILE")) {
        HStack {
          Spacer()
          if let image = character.image,
             let url = URL(string: image) {
            KFImage(url)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 150, height: 150)
              .cornerRadius(25)
          } else {
            RoundedRectangle(cornerRadius: 25)
              .frame(width: 150, height: 150)
              .foregroundColor(.gray)
          }
          Spacer()
        }
      }
      Section(header: Text("INFO")) {
        InfoRowView(label: "Species", icon: "ladybug", value: character.species ?? "")
        InfoRowView(label: "Gender", icon: "arrow.up.forward.circle", value: character.gender ?? "")
        InfoRowView(label: "Status", icon: "waveform.path.ecg", value: character.status ?? "")
        InfoRowView(label: "Location", icon: "globe.americas.fill", value: character.location.name ?? "")
        InfoRowView(label: "Origin", icon: "globe.americas.fill", value: character.origin.dimension ?? "")
      }
      Section(header: Text("EPISODES")) {
        ForEach(character.episode, id: \.id) { item in
          Text(item.name ?? "")
        }
      }
    }
  }
}

// struct CharacterDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterDetailView(character:
//            CharacterModel(result: FetchAllCharactersQuery.Data.Character.Result?
//            .init(FetchAllCharactersQuery.Data.Character.Result
//                .init(name: "Pickle Rick", species: "Pickle", gender: "Male", image: ""))))
//
//    }
// }
