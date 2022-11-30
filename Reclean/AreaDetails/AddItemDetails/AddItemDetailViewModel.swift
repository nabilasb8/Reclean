//
//  AddItemDetailViewModel.swift
//  Reclean
//
//  Created by Nabila on 25/11/22.
//

import Foundation

class AddItemDetailViewModel {
    
    func getActivities(placeId: String, didGetActivities: @escaping (([MasterActivity]) -> Void)) {
        let activities = MasterActivityRepository.shared.getMasterActivities(placeId: placeId)
        didGetActivities(activities)
    }
    
    func addItemActivity(id: String, areaId: String, activityId: String, description: String, date: Date, intervalId: String) {
        let item = ItemActivity(
            id: id,
            areaId: areaId,
            activityId: activityId,
            description: description,
            date: date,
            intervalId: intervalId
        )
        ItemRepository.shared.addItemActivity(item: item)
    }
    
    func getIntervals(didGetIntervals: @escaping (([MasterInterval]) -> Void)) {
        let intervals = MasterIntervalRepository.shared.getMasterInterval()
        didGetIntervals(intervals)
    }
}
