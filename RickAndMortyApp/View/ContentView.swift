//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 9.05.2022.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = CharacterViewModel()
    
    var body: some View {
        
        
        NavigationView{
            
            
            List{
            
                ForEach(viewModel.characters, id: \.name) { character in
                
                HStack {
                    if let image = character.image,
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
                        Text(character.name )
                            .font(.title3)
                            .foregroundColor(.accentColor)
                            .redacted(reason: character.name == nil ? .placeholder : [])

                    
                    }

                }
                
                }
                
            }
        }
                    
                
            
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
