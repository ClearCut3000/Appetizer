//
//  LoadingView.swift
//  Appetizer
//
//  Created by Николай Никитин on 01.09.2022.
//

import SwiftUI

struct CustomCircularProgressViewStyle: ProgressViewStyle {
  var strokeColor = Color.blue
  var strokeWidth = 25.0

  func makeBody(configuration: Configuration) -> some View {
    ProgressView(configuration)
      .tint(.brandPrimary)
      .scaleEffect(4)
  }
}

struct LoadingView: View {
  var body: some View {
    ZStack {
      ProgressView()
        .progressViewStyle(CustomCircularProgressViewStyle())
    }
  }
}
