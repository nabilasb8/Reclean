//
//  ScheduleCellType.swift
//  Reclean
//
//  Created by Nabila Syafrina on 01/12/22.
//

import Foundation

enum ScheduleCellType {
    case header(title: String?, action: ScheduleHeaderActionType, isBtnDetailsHidden: Bool)
    case activityItem(itemActivity: ItemActivity)
    case areaItem(area: Area)
}
