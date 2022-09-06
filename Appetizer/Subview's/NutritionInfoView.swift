//
//  NutritionInfoView.swift
//  Appetizer
//
//  Created by Николай Никитин on 02.09.2022.
//

import SwiftUI

struct NutritionInfoView: View {

  //MARK: - View Properties
  let title: String
  let value: String

  //MARK: - View Body
    var body: some View {
      VStack(spacing: 5) {
        Text(title)
          .bold()
          .font(.caption)

        Text(value)
          .foregroundColor(.secondary)
          .fontWeight(.semibold)
          .italic()
      }
    }
}

struct NutritionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionInfoView(title: "Some sample title", value: String(99))
    }
}
