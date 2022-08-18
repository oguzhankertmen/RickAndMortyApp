//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 9.05.2022.
//

import KingfisherSwiftUI
import SwiftUI

struct CharacterListView: View {
  @ObservedObject var viewModel = CharactersViewModel(charactersApi: CharactersService())

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.charactersArray, id: \.id) { character in
          NavigationLink(
            destination: CharacterDetailView(character: character),
            label: {
              CharacterListRowView(character: character)
            }
          )
        }
      }.listStyle(PlainListStyle())

        .navigationBarTitle("Characters")
    }.onAppear(perform: viewModel.getCharacters)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterListView()
  }
}
