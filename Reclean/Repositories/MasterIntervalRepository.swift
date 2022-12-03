//
//  MasterIntervalRepository.swift
//  Reclean
//
//  Created by Nabila on 25/11/22.
//

import Foundation

class MasterIntervalRepository {
    static let shared = MasterIntervalRepository()
    
    func getMasterInterval() -> [MasterInterval] {
        generateDummyMasterInterval()
    }
    
    func getMasterIntervalById(id: String) -> MasterInterval? {
        return getMasterInterval().first { interval in
            return interval.id == id
        }
    }
    
    private func generateDummyMasterInterval() -> [MasterInterval] {
        var masterIntervals: [MasterInterval] = []
        
        let interval1: MasterInterval = MasterInterval(
            id: "daily",
            duration: 1,
            name: "Daily"
        )
        masterIntervals.append(interval1)
        
        let interval2: MasterInterval = MasterInterval(
            id: "weekly",
            duration: 7,
            name: "Weekly"
        )
        masterIntervals.append(interval2)
        
        let interval3: MasterInterval = MasterInterval(
            id: "monthly",
            duration: 30,
            name: "Monthly"
        )
        masterIntervals.append(interval3)
        
        return masterIntervals
    }
}
