//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

@main
struct AppetizerApp: App {

  var order = Order()

    var body: some Scene {
        WindowGroup {
          AppetizerTabView().environmentObject(order)
        }
    }
}
