//
//  CharacterListRowView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 18.05.2022.
//

import KingfisherSwiftUI
import SwiftUI

struct CharacterListRowView: View {
  let character: CharacterResponseDTO.Character
  var body: some View {
    HStack {
      if let image = character.image ?? "",
         let url = URL(string: image) {
        KFImage(url)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50, height: 50)
          .cornerRadius(25)
      } else {
        RoundedRectangle(cornerRadius: 25)
          .frame(width: 50, height: 50)
          .foregroundColor(.gray)
      }
      VStack(alignment: .leading) {
        Text(character.name ?? "")
          .font(.title3)
          .foregroundColor(.black)
          .redacted(reason: character.name == nil ? .placeholder : [])
      }
    }
  }
}

// struct CharacterListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterListRowView(character: CharacterModel(result: FetchAllCharactersQuery.Data.Character.Result?
//            .init(FetchAllCharactersQuery.Data.Character.Result
//                .init(name: "Pickle Rick", species: "Pickle", gender: "Male", image: "", episode: [FetchAllCharactersQuery.Data.Character.Result.Episode?].init()))))
//    }
// }
