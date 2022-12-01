//
//  AddAreaViewModel.swift
//  Reclean
//
//  Created by Nabila Syafrina on 01/12/22.
//

import Foundation

class AddAreaViewModel {
    
    func getMasterPlaces(didGetMasterPlaces: @escaping (([MasterPlace]) -> Void)) {
        let places = MasterPlaceRepository.shared.getPlaces()
        didGetMasterPlaces(places)
    }
    
    func addArea(placeId: String, description: String) {
        let area = Area(
            id: UUID().uuidString,
            placeId: placeId,
            description: description
        )
        AreaRepository.shared.addArea(area: area)
    }
}
