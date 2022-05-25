//
//  InfoRowView.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 24.05.2022.
//

import SwiftUI

struct InfoRowView: View {
  let label: String
  let icon: String
  let value: String
  
  var body: some View {
    HStack {
      Label(label, systemImage: icon)
      Spacer()
      Text(value)
        .foregroundColor(.accentColor)
        .fontWeight(.semibold)
    }
  }
}
