//
//  ActivityDetailsViewModel.swift
//  ReClean
//
//  Created by Nabila Syafrina on 03/12/22.
//

import Foundation

class ActivityDetailsViewModel {
    
    func deleteActivity(id: String) {
        ItemRepository.shared.deleteItemActivity(id: id)
    }
}
