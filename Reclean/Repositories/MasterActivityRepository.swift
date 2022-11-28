//
//  MasterActivityRepository.swift
//  Reclean
//
//  Created by Nabila on 25/11/22.
//

import Foundation

class MasterActivityRepository {
    static let shared = MasterActivityRepository()
    
    func getMasterActivity(placeId: String) -> [MasterActivity] {
        return generateDummyMasterActivities()
            .filter { $0.placeId == placeId }
    }
    
    private func generateDummyMasterActivities() -> [MasterActivity] {
        var masterActivities: [MasterActivity] = []
        
        let masterActivity1: MasterActivity = MasterActivity(
            id: "laundry",
            name: "Laundry",
            point: 10,
            placeId: "laundry-room"
        )
        masterActivities.append(masterActivity1)
        
        let masterActivity2: MasterActivity = MasterActivity(
            id: "vacuum-bed",
            name: "Vacuum bed",
            point: 5,
            placeId: "bed-room"
        )
        masterActivities.append(masterActivity2)
        
        let masterActivity3: MasterActivity = MasterActivity(
            id: "washing-dishes",
            name: "Washing dishes",
            point: 10,
            placeId: "kitchen"
        )
        masterActivities.append(masterActivity3)
        
        let masterActivity4: MasterActivity = MasterActivity(
            id: "ironing-clothes",
            name: "Ironing clothes",
            point: 10,
            placeId: "laundry-room"
        )
        masterActivities.append(masterActivity4)
        
        return masterActivities
    }
}
