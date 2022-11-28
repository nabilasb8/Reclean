//
//  MasterPlaceRepository.swift
//  Reclean
//
//  Created by Nabila on 25/11/22.
//

import Foundation

class MasterPlaceRepository {
    static let shared = MasterPlaceRepository()

    func getPlaces() -> [MasterPlace] {
        return generateDummyPlaces()
    }
    
    func getPlace(id: String) -> MasterPlace? {
        return getPlaces().first(where: { $0.id == id })
    }
    
    private func generateDummyPlaces() -> [MasterPlace] {
        var places: [MasterPlace] = []
        
        let place1: MasterPlace = MasterPlace(
            id: "laundry-room",
            name: "Laundry Room"
        )
        places.append(place1)
        
        let place2: MasterPlace = MasterPlace(
            id: "bed-room",
            name: "Bedroom"
        )
        places.append(place2)
        
        let place3: MasterPlace = MasterPlace(
            id: "kitchen",
            name: "Kitchen"
        )
        places.append(place3)
        
        return places
    }
}


