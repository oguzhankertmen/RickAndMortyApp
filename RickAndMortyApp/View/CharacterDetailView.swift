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
        
        Text(character.name).bold()
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
            
            Section(header: Text("Info")) {
                InfoRowView(label: "Species", icon: "ladybug", value: character.species)
                InfoRowView(label: "Gender", icon: "arrow.up.forward.circle", value: character.gender)
                InfoRowView(label: "Status", icon: "waveform.path.ecg", value: character.status)
                
            }
                
        }
    }
}

//struct CharacterDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterDetailView(character:
//            CharacterModel(result: FetchAllCharactersQuery.Data.Character.Result?
//            .init(FetchAllCharactersQuery.Data.Character.Result
//                .init(name: "Pickle Rick", species: "Pickle", gender: "Male", image: ""))))
//                      
//    }
//}
