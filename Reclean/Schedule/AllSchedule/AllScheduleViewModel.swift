//
//  AllScheduleViewModel.swift
//  ReClean
//
//  Created by Nabila Syafrina on 03/12/22.
//

import Foundation

class AllScheduleViewModel {
    
    func getAllSchedules(didGetAllSchedules: @escaping (([ItemActivity]) -> Void)) {
        let result = ItemRepository.shared.getItemActivities()
        didGetAllSchedules(result)
    }
    
    func markItemAsDone(id: String) {
        ItemRepository.shared.setFinishDate(id: id, finishDate: Date())
    }
}
