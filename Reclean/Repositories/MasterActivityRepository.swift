//
//  MasterActivityRepository.swift
//  Reclean
//
//  Created by Nabila on 25/11/22.
//

import Foundation

class MasterActivityRepository {
    static let shared = MasterActivityRepository()
    
    func getMasterActivities(placeId: String) -> [MasterActivity] {
        return generateDummyMasterActivities()
            .filter { $0.placeId == placeId }
    }
    
    func getMasterActivity(id: String) -> MasterActivity? {
        return generateDummyMasterActivities()
            .first(where: { $0.id == id })
    }
    
    private func generateDummyMasterActivities() -> [MasterActivity] {
        var masterActivities: [MasterActivity] = []
        
        let masterActivity1: MasterActivity = MasterActivity(
            id: "vacuum-carpet",
            name: "Vacuum Carpet",
            point: 10,
            placeId: "living-room"
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
        
        let masterActivity5: MasterActivity = MasterActivity(
            id: "bathroom-sink",
            name: "Bathroom Sink",
            point: 10,
            placeId: "bath-room"
        )
        masterActivities.append(masterActivity5)
        
        let masterActivity6: MasterActivity = MasterActivity(
            id: "faucet",
            name: "Faucet",
            point: 5,
            placeId: "bath-room"
        )
        masterActivities.append(masterActivity6)
        
        let masterActivity7: MasterActivity = MasterActivity(
            id: "shower",
            name: "Shower",
            point: 5,
            placeId: "bath-room"
        )
        masterActivities.append(masterActivity7)
        
        let masterActivity8: MasterActivity = MasterActivity(
            id: "toilet-closet",
            name: "Toilet Closet",
            point: 10,
            placeId: "bath-room"
        )
        masterActivities.append(masterActivity8)
        
        let masterActivity9: MasterActivity = MasterActivity(
            id: "wipe-fridge",
            name: "Wipe Fridge",
            point: 5,
            placeId: "kitchen"
        )
        masterActivities.append(masterActivity9)
        
        let masterActivity10: MasterActivity = MasterActivity(
            id: "sweeping-floors",
            name: "Sweeping Floors",
            point: 5,
            placeId: "kitchen"
        )
        masterActivities.append(masterActivity10)
        
        let masterActivity11: MasterActivity = MasterActivity(
            id: "kitchen-wall",
            name: "Kitchen Wall",
            point: 5,
            placeId: "kitchen"
        )
        masterActivities.append(masterActivity11)
        
        let masterActivity12: MasterActivity = MasterActivity(
            id: "wipe-furniture",
            name: "Wipe Furnitures",
            point: 5,
            placeId: "living-room"
        )
        masterActivities.append(masterActivity12)
        
        let masterActivity13: MasterActivity = MasterActivity(
            id: "wipe-windows",
            name: "Wipe Window",
            point: 5,
            placeId: "living-room"
        )
        masterActivities.append(masterActivity13)
        
        let masterActivity14: MasterActivity = MasterActivity(
            id: "vacuum-sofa",
            name: "Vacuum Sofa",
            point: 5,
            placeId: "living-room"
        )
        masterActivities.append(masterActivity14)
        
        let masterActivity15: MasterActivity = MasterActivity(
            id: "replace-pillow-cases",
            name: "Replace Pillow Cases",
            point: 5,
            placeId: "bed-room"
        )
        masterActivities.append(masterActivity15)
        
        let masterActivity16: MasterActivity = MasterActivity(
            id: "vacuum-curtain",
            name: "Vacuum Curtain",
            point: 10,
            placeId: "bed-room"
        )
        masterActivities.append(masterActivity16)
        
        let masterActivity17: MasterActivity = MasterActivity(
            id: "declutter-wardrobe",
            name: "Declutter Wardrobe",
            point: 10,
            placeId: "bed-room"
        )
        masterActivities.append(masterActivity17)
        
        return masterActivities
    }
}
