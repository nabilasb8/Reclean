//
//  AddItemDetailViewModel.swift
//  Reclean
//
//  Created by Nabila on 25/11/22.
//

import Foundation

class AddItemDetailViewModel {
    
    func getActivities(placeId: String, didGetActivities: @escaping (([MasterActivity]) -> Void)) {
        let activities = MasterActivityRepository.shared.getMasterActivity(placeId: placeId)
        didGetActivities(activities)
    }
    
}
