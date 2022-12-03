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
    
    func getItemActivities() -> [ItemActivity] {
        return items
            .filter { item in
                return item.finishDate == nil
            }
    }
    
    func getPastItemActivities() -> [ItemActivity] {
        return items
            .filter { item in
                return item.finishDate != nil
            }
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
    
    func setFinishDate(id: String, finishDate: Date) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].finishDate = finishDate
        }
    }
}
