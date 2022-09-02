//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Николай Никитин on 02.09.2022.
//

import SwiftUI

struct AppetizerDetailView: View {

  //MARK: - View Properties
  let appetizer: Appetizer

  //MARK: - View Body
  var body: some View {
    VStack {
      Image("food-placeholder")
        .resizable()
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
          VStack(spacing: 5) {
            Text("Calories")
              .bold()
              .font(.caption)

            Text("\(appetizer.calories)")
              .foregroundColor(.secondary)
              .fontWeight(.semibold)
              .italic()
          }
          VStack(spacing: 5) {
            Text("Carbs")
              .bold()
              .font(.caption)

            Text("\(appetizer.carbs)")
              .foregroundColor(.secondary)
              .fontWeight(.semibold)
              .italic()
          }
          VStack(spacing: 5) {
            Text("Proten")
              .bold()
              .font(.caption)

            Text("\(appetizer.protein)")
              .foregroundColor(.secondary)
              .fontWeight(.semibold)
              .italic()
          }
        }
      }

      Spacer()

      Button {

      } label: {
        Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
          .font(.title3)
          .fontWeight(.semibold)
          .frame(width: 260, height: 50)
          .foregroundColor(.white)
          .background(Color.brandPrimary)

      }
      .padding(.bottom, 30)
    }
    .frame(width: 300, height: 525)
    .background(Color(.systemBackground))
    .cornerRadius(12)
    .shadow(radius: 40)
    .overlay(
      Button {

      } label: {
        ZStack {
          Circle()
            .frame(width: 30, height: 30)
            .foregroundColor(.white)
            .opacity(0.6)
            Image(systemName: "xmark")
            .imageScale(.large)
            .frame(width: 44, height: 44)
            .foregroundColor(.black)
        }
      }
      , alignment: .topTrailing)
  }
}

struct AppetizerDetailView_Previews: PreviewProvider {
  static var previews: some View {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
  }
}
