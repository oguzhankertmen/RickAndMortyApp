//
//  CharacterDetailView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 16.05.2022.
//

import SwiftUI
import KingfisherSwiftUI

struct CharacterDetailView: View {
    
    let character: CharacterModel
    
    var body: some View {
        List {
            Section(header: Text("Profile")) {
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
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: CharacterModel(result: FetchAllCharactersQuery.Data.Character.Result?.init(FetchAllCharactersQuery.Data.Character.Result.init(name: "Pickle Rick", species: "Pickle", gender: "Male", image: "https://cdn.wannart.com/production/post/2018/09/https-blueprint-api-production.s3.amazonaws.com-uploads-card-image-559122-6a39f256-fa39-414b-a29c-a9b52bd9c049.png"))))
    }
}
