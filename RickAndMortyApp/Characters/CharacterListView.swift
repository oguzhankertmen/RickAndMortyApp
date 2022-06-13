//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 9.05.2022.
//

import SwiftUI
import KingfisherSwiftUI

struct CharacterListView: View {
  
  @StateObject var viewModel = CharacterService()
  
  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.characters, id: \.name) { character in
          NavigationLink(
            destination: CharacterDetailView(character: character),
            label: {
              CharacterListRowView(character: character)
            })
        }
      }.listStyle(PlainListStyle())
        .navigationBarTitle("Characters")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterListView()
  }
}
