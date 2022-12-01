//
//  ListItemViewModel.swift
//  Reclean
//
//  Created by Nabila Syafrina on 30/11/22.
//

import Foundation

class ListItemViewModel {
    
    func getItems(areaId: String, didGetItems: @escaping (([ItemActivity]) -> Void)) {
        let result = ItemRepository.shared.getItemActivitiesByArea(areaId: areaId)
        didGetItems(result)
    }
}
