//
//  ItemActivity.swift
//  Reclean
//
//  Created by Nabila on 25/11/22.
//

import Foundation

struct ItemActivity {
    var id: String
    var areaId: String
    var activityId: String
    var description: String
    var date: Date
    var intervalId: String
    var finishDate: Date?
    
    func getActivity() -> MasterActivity? {
        return MasterActivityRepository.shared.getMasterActivity(id: self.activityId)
    }
    
    func getArea() -> Area? {
        return AreaRepository.shared.getArea(id: self.areaId)
    }
    
    func getInterval() -> MasterInterval? {
        return MasterIntervalRepository.shared.getMasterIntervalById(id: intervalId)
    }
}
