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

        NavigationView {

            List {
                
                ForEach(viewModel.characters, id: \.name) { character in
                    NavigationLink(
                        destination: CharacterDetailView(character: character),
                        label: {
                            CharacterListRowView(character: character)
                        } )

                }

            }.listStyle(DefaultListStyle())
            .navigationBarTitle("Characters")

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
