//
//  LocationsViewModel.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 11.08.2022.
//

import Foundation

class LocationsViewModel: ObservableObject {
  @Published var locationsArray: [LocationsResponseDTO.Location] = []

  let locationsService: LocationsApi

  init(locationsApi: LocationsApi) {
    self.locationsService = locationsApi
  }

  func getLocations() {
    self.locationsService.getLocations { result in
      switch result {
      case let .success(locationsArray):
        if let locationsArray = locationsArray {
          DispatchQueue.main.async {
            self.locationsArray = locationsArray.results
          }
        }

      case let .failure(error):
        print(error.localizedDescription)
      }
    }
  }
}
