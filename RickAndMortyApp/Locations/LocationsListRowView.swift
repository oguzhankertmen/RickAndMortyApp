//
//  LocationsListRowView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 12.08.2022.
//

import SwiftUI

struct LocationsListRowView: View {
  let location: LocationsResponseDTO.Location
  var body: some View {
    HStack(alignment: .center) {
      VStack(alignment: .leading) {
        Text(location.name ?? "")
          .foregroundColor(.black)
      }
      Spacer()
      Text(location.created ?? "")

        .foregroundColor(.gray)
        .font(.footnote)
    }.redacted(reason: location.name == nil ? .placeholder : [])
  }
}

// struct LocationsListRowView_Previews: PreviewProvider {
//  static var previews: some View {
//    LocationsListRowView()
//  }
// }
