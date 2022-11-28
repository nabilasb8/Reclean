//
//  Area.swift
//  Reclean
//
//  Created by Nabila on 25/11/22.
//

import Foundation

struct Area {
    var id: String
    var placeId: String
    var description: String
    
    func getPlace() -> MasterPlace? {
        return MasterPlaceRepository.shared.getPlace(id: placeId)
    }
}
