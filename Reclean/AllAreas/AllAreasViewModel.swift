//
//  AllAreasViewModel.swift
//  Reclean
//
//  Created by Nabila Syafrina on 29/11/22.
//

import Foundation

class AllAreasViewModel {
    
    func getAreas(didGetAreas: @escaping (([Area]) -> Void)) {
        let result = AreaRepository.shared.getAreas()
        didGetAreas(result)
    }
}
