//
//  Date+Extension.swift
//  Reclean
//
//  Created by Nabila on 23/11/22.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
