//
//  ProfileViewModel.swift
//  ReClean
//
//  Created by Nabila Syafrina on 02/12/22.
//

import Foundation

class ProfileViewModel {
    func getPastActivities(didGetPastActivities: @escaping (([ItemActivity]) -> Void)) {
        let pastActivities = ItemRepository.shared.getPastItemActivities()
        didGetPastActivities(pastActivities)
    }
}
