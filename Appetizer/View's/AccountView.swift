//
//  AccountView.swift
//  Appetizer
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
      NavigationView {
        Text("Account View")
          .navigationTitle("Account")
      }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
