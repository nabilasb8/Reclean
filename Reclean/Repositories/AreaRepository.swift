//
//  AreaRepository.swift
//  Reclean
//
//  Created by Nabila on 25/11/22.
//

import Foundation

class AreaRepository {
    static let shared = AreaRepository()
    
    func getAreas() -> [Area] {
        return generateDummyAreas()
    }
    
    private func generateDummyAreas() -> [Area] {
        var areas: [Area] = []
        
        let area1: Area = Area(
            id: UUID().uuidString,
            placeId: "living-room",
            description: "Ruang tamu"
        )
        areas.append(area1)
        
        let area2: Area = Area(
            id: UUID().uuidString,
            placeId: "bed-room",
            description: "Kamar utama"
        )
        areas.append(area2)
        
        let area3: Area = Area(
            id: UUID().uuidString,
            placeId: "kitchen",
            description: "Dapur bersih"
        )
        areas.append(area3)
        
        return areas
    }
}
