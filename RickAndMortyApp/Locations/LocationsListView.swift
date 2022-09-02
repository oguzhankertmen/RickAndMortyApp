//
//  LocationsListView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 11.08.2022.
//

import SwiftUI

struct LocationsListView: View {
  @ObservedObject var viewModel = LocationsViewModel(locationsApi: LocationsService())
  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.locationsArray, id: \.id) { location in
          NavigationLink(
            destination: LocationsDetailView(location: location),
            label: {
              LocationsListRowView(location: location)
            }
          )
        }
      }.listStyle(PlainListStyle())
        .navigationBarTitle("Locations")
    }.onAppear(perform: viewModel.getLocations)
  }
}

// struct LocationsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationsListView()
//    }
// }
