//
//  AreaRepository.swift
//  Reclean
//
//  Created by Nabila on 25/11/22.
//

import Foundation

class AreaRepository {
    static let shared = AreaRepository()
    
    private var areas: [Area] = []
    
    func getAreas() -> [Area] {
        return areas
    }
    
    func getArea(id: String) -> Area? {
        return areas
            .first { area in
                return area.id == id
            }
    }
    
    func addArea(area: Area) {
        areas.append(area)
    }
    
    private func generateDummyAreas() -> [Area] {
        var areas: [Area] = []
        
        let area1: Area = Area(
            id: "area1",
            placeId: "living-room",
            description: "Ruang tamu"
        )
        areas.append(area1)
        
        let area2: Area = Area(
            id: "area2",
            placeId: "bed-room",
            description: "Kamar utama"
        )
        areas.append(area2)
        
        let area3: Area = Area(
            id: "area3",
            placeId: "kitchen",
            description: "Dapur bersih"
        )
        areas.append(area3)
        
        return areas
    }
}
