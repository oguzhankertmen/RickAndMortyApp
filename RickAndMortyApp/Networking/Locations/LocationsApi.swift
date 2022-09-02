//
//  LocationsApi.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 11.08.2022.
//

import Foundation

public protocol LocationsApi {
  func getLocations(onComplete: @escaping (Result<LocationsResponseDTO?, ApiError>) -> Void)
}
