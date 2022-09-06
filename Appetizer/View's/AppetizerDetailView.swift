//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Николай Никитин on 02.09.2022.
//

import SwiftUI

struct AppetizerDetailView: View {

  //MARK: - View Properties
  @EnvironmentObject var order: Order
  let appetizer: Appetizer
  @Binding var isShowingDetail: Bool

  //MARK: - View Body
  var body: some View {
    VStack {
      AppetizersRemoteImage(URLString: appetizer.imageURL)
        .scaledToFit()
        .frame(width: 300, height: 225)

      VStack {
        Text(appetizer.name)
          .font(.title2)
          .fontWeight(.semibold)

        Text(appetizer.description)
          .multilineTextAlignment(.center)
          .font(.body)
          .padding()

        HStack(spacing: 40) {
          NutritionInfoView(title: "Calories", value: "\(appetizer.calories)")
          NutritionInfoView(title: "Carbs", value: "\(appetizer.carbs) g")
          NutritionInfoView(title: "Proten", value: "\(appetizer.protein) g")
        }
      }

      Spacer()
      
      Button {
        order.add(appetizer)
        isShowingDetail = false
      } label: {
        APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to order")
      }
      .padding(.bottom, 30)
    }
    .frame(width: 300, height: 525)
    .background(Color(.systemBackground))
    .cornerRadius(12)
    .shadow(radius: 40)
    .overlay(
      Button {
        isShowingDetail = false
      } label: {
        XDismissButton()
      }, alignment: .topTrailing)
  }
}

struct AppetizerDetailView_Previews: PreviewProvider {
  static var previews: some View {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
  }
}
