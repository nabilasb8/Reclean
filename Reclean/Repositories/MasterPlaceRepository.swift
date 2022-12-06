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
            id: "living-room",
            name: "Living Room",
            iconName: "living_room"
        )
        places.append(place1)
        
        let place2: MasterPlace = MasterPlace(
            id: "bed-room",
            name: "Bedroom",
            iconName: "bed_room"
        )
        places.append(place2)
        
        let place3: MasterPlace = MasterPlace(
            id: "kitchen",
            name: "Kitchen",
            iconName: "kitchen"
        )
        places.append(place3)
        
        let place4: MasterPlace = MasterPlace(
            id: "bath-room",
            name: "Bathroom",
            iconName: "kitchen"
        )
        places.append(place4)
        
        return places
    }
}


