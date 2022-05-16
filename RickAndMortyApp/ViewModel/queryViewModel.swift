//
//  queryViewModel.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 11.05.2022.
//

import Foundation


class queryViewModel {
    
    
    
    func fetchQueryResults (){
        
        Network.shared.apollo.fetch(query: FetchAllCharactersQuery()) { result in
            switch result{
            case .success(let graphQLResult):
                DispatchQueue.main.async {
                    if let character = graphQLResult.data?.characters?.results{
                        self.characters = character
                    }
                }
            case .failure(let error):
                print("Error: \(error)")
            }
            
        }
    }
}
