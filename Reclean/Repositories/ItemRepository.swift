//
//  ItemRepository.swift
//  Reclean
//
//  Created by Nabila on 25/11/22.
//

import Foundation

class ItemRepository {
    static let shared = ItemRepository()
    
    func getMasterItem() -> [ItemActivity] {
        generateDummyItemActivities()
    }
    
    private func generateDummyItemActivities() -> [ItemActivity] {
        var itemRepositories: [ItemActivity] = []
        
        let item1: ItemActivity = ItemActivity(
            id: UUID().uuidString,
            areaId: "laundry-room",
            activityId: "laundry",
            description: "Baju kerja",
            date: "25 Nov 2022",
            intervalId: "daily"
        )
        itemRepositories.append(item1)
        
        let item2: ItemActivity = ItemActivity(
            id: UUID().uuidString,
            areaId: "bed-room",
            activityId: "vacuum-bed",
            description: "Hard cleaning",
            date: "26 Nov 2022",
            intervalId: "weekly"
        )
        itemRepositories.append(item2)
        
        let item3: ItemActivity = ItemActivity(
            id: UUID().uuidString,
            areaId: "kitchen",
            activityId: "washing-dishes",
            description: "Cuci piring & gelas",
            date: "27 Nov 2022",
            intervalId: "monthly"
        )
        itemRepositories.append(item3)
        
        return itemRepositories
    }
}
