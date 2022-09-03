//
//  AppetizerTabView.swift
//  Appetizer
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct AppetizerTabView: View {
  var body: some View {
    TabView {
      AppetizerListView()
        .tabItem {
          Image(systemName: "house.fill")
          Text("Home")
        }

      AccountView()
        .tabItem {
          Image(systemName: "person.fill")
          Text("Account")
        }

      OrderView()
        .tabItem {
          Image(systemName: "bag.fill")
          Text("Order")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    AppetizerTabView()
  }
}
