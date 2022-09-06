//
//  Date+Extension.swift
//  Appetizer
//
//  Created by Николай Никитин on 06.09.2022.
//

import Foundation

extension Date {

  var eighteenYearAgo: Date {
    Calendar.current.date(byAdding: .year, value: -18, to: Date())!
  }

  var oneHundredTenYearsAgo: Date {
    Calendar.current.date(byAdding: .year, value: -110, to: Date())!
  }
}
