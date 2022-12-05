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
        
        let todayItems = items
            .filter { item in
                return Calendar.current.isDateInToday(item.date)
            }
        
        let areas = AreaRepository.shared.getAreas()
        
        if !todayItems.isEmpty {
            dataSource.append(.header(
                title: "Today's Schedule",
                action: .allSchedule,
                isBtnDetailsHidden: todayItems.count <= 3
            ))
            todayItems
                .prefix(3)
                .forEach { item in
                dataSource.append(.activityItem(itemActivity: item))
            }
        }
        
        if !areas.isEmpty {
            dataSource.append(.header(
                title: "Areas",
                action: .allArea,
                isBtnDetailsHidden: false
            ))
            areas
                .prefix(3)
                .forEach { area in
                dataSource.append(.areaItem(area: area))
            }
        }
        
        if !newestItems.isEmpty {
            dataSource.append(.header(
                title: "Schedules",
                action: .allSchedule,
                isBtnDetailsHidden: newestItems.count <= 3
            ))
            newestItems
                .prefix(3)
                .forEach { item in
                dataSource.append(.activityItem(itemActivity: item))
            }
        }
        
        didGetDataSource(dataSource)
    }
    
    func markItemAsDone(id: String) {
        ItemRepository.shared.setFinishDate(id: id, finishDate: Date())
    }
    
}
