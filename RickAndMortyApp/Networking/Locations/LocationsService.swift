//
//  LocationsService.swift
//  RickAndMortyApp
//
//  Created by Oğuzhan KERTMEN on 11.08.2022.
//

import Foundation

public struct LocationsService: LocationsApi {
  public func getLocations(onComplete: @escaping (Result<LocationsResponseDTO?, ApiError>) -> Void) {
    Network.shared.apollo.fetch(query: GetLocationsQuery()) { result in
      switch result {
      case let .success(graphQLResult):
        let data = graphQLResult.data
        let locations: [GetLocationsQuery.Data.Location.Result] = (data?.locations?.results?.compactMap { $0 })!
        let mappedLocations = locations.map { location in
          LocationsResponseDTO.Location(
            id: location.id ?? "",
            name: location.name ?? "",
            dimension: location.dimension ?? "",
            residents: location.residents.map { item in
              LocationsResponseDTO.Character(
                id: item?.id ?? "",
                name: item?.name ?? "",
                image: item?.image ?? ""
              )
            },
            created: location.created ?? ""
          )
        }
        let responseDTO = LocationsResponseDTO(
          info: LocationsResponseDTO.Info(
            count: data?.locations?.info?.count ?? nil,
            pages: data?.locations?.info?.pages ?? nil,
            next: data?.locations?.info?.next ?? nil,
            prev: data?.locations?.info?.prev ?? nil
          ),
          results: mappedLocations
        )

        onComplete(.success(responseDTO))

      case let .failure(error):
        print(error.localizedDescription)
        onComplete(.failure(.dataNotArrived))
      }
    }
  }
}
