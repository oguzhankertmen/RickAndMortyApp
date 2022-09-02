//
//  LocationsDetailView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 12.08.2022.
//

import KingfisherSwiftUI
import SwiftUI

struct LocationsDetailView: View {
  let location: LocationsResponseDTO.Location
  var body: some View {
    List {
      Section(header: Text("INFO")) {
        InfoRowView(label: "Name", icon: "info", value: location.name ?? "")
        InfoRowView(label: "Dimension", icon: "calendar", value: location.dimension ?? "")
        InfoRowView(label: "Episode", icon: "barcode.viewfinder", value: location.created ?? "")
      }
      Section(header: Text("CHARACTERS")) {
        ForEach(location.residents, id: \.id) { item in
          HStack {
            if let image = item.image ?? "",
               let url = URL(string: image) {
              KFImage(url)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
                .cornerRadius(25)
            } else {
              RoundedRectangle(cornerRadius: 25)
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
            }
            VStack(alignment: .leading) {
              Text(item.name ?? "")
                .font(.body)
                .foregroundColor(.black)
                .redacted(reason: item.name == nil ? .placeholder : [])
            }
          }
        }
      }
    }
  }
}

// struct LocationsDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationsDetailView()
//    }
// }
