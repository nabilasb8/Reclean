//
//  ItemRepository.swift
//  Reclean
//
//  Created by Nabila on 25/11/22.
//

import Foundation

class ItemRepository {
    static let shared = ItemRepository()
    private var items: [ItemActivity] = []
    
    init() {
        items = generateDummyItemActivities()
    }
    
    func getItemActivities() -> [ItemActivity] {
        return items
    }
    
    func getItemActivitiesByArea(areaId: String) -> [ItemActivity] {
        return getItemActivities()
            .filter { item in
                return item.areaId == areaId
            }
    }
    
    func addItemActivity(item: ItemActivity) {
        items.append(item)
    }
    
    private func generateDummyItemActivities() -> [ItemActivity] {
        var itemRepositories: [ItemActivity] = []
        
        let item1: ItemActivity = ItemActivity(
            id: UUID().uuidString,
            areaId: "area1",
            activityId: "vacuum-carpet",
            description: "Baju kerja",
            date: Date(),
            intervalId: "daily"
        )
        itemRepositories.append(item1)
        
        let item2: ItemActivity = ItemActivity(
            id: UUID().uuidString,
            areaId: "area2",
            activityId: "vacuum-bed",
            description: "Hard cleaning",
            date: Date(),
            intervalId: "weekly"
        )
        itemRepositories.append(item2)
        
        let item3: ItemActivity = ItemActivity(
            id: UUID().uuidString,
            areaId: "area3",
            activityId: "washing-dishes",
            description: "Cuci piring & gelas",
            date: Date(),
            intervalId: "monthly"
        )
        itemRepositories.append(item3)
        
        return itemRepositories
    }
}
