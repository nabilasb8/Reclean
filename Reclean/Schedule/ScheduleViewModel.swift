//
//  ScheduleViewModel.swift
//  Reclean
//
//  Created by Nabila Syafrina on 01/12/22.
//

import Foundation

class ScheduleViewModel {
    
    func getDataSource(didGetDataSource: @escaping (([ScheduleCellType]) -> Void)) {
        var dataSource: [ScheduleCellType] = []
        
        let items = ItemRepository.shared.getItemActivities()
        let newestItems = items
            .sorted(by: { $0.date > $1.date })
            .prefix(3)
        
        let todayItems = items
            .filter { item in
                return Calendar.current.isDateInToday(item.date)
            }
            .prefix(3)
        
        let areas = AreaRepository.shared.getAreas()
            .prefix(3)
        
        if !todayItems.isEmpty {
            dataSource.append(.header(
                title: "Today's Schedule",
                action: .allSchedule
            ))
            todayItems.forEach { item in
                dataSource.append(.activityItem(itemActivity: item))
            }
        }
        
        if !areas.isEmpty {
            dataSource.append(.header(
                title: "All Areas",
                action: .allArea
            ))
            areas.forEach { area in
                dataSource.append(.areaItem(area: area))
            }
        }
        
        if !items.isEmpty {
            dataSource.append(.header(
                title: "All Schedules",
                action: .allSchedule
            ))
            newestItems.forEach { item in
                dataSource.append(.activityItem(itemActivity: item))
            }
        }
        
        didGetDataSource(dataSource)
    }
    
    func markItemAsDone(id: String) {
        ItemRepository.shared.setItemStatus(id: id, isDone: true)
    }
    
}
