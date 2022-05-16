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
    var image: String
    
    init(result: FetchAllCharactersQuery.Data.Character.Result?) {
        
        self.name = result?.name ?? "-"
        self.species = result?.species ?? "-"
        self.gender = result?.gender ?? "-"
        self.image = result?.image ?? "-"
    }
}
