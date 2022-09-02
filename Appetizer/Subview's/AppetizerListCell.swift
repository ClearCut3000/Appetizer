//
//  AppetizerListCell.swift
//  Appetizer
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct AppetizerListCell: View {

  //MARK: - View Properties
  let appetizer: Appetizer

  //MARK: - View Body
    var body: some View {
      HStack {
        AppetizersRemoteImage(URLString: appetizer.imageURL)
          .scaledToFit()
          .frame(width: 120, height: 90)
          .cornerRadius(8)
        VStack(alignment: .leading) {
          Text(appetizer.name)
            .font(.title2)
            .fontWeight(.medium)
          Text("$ \(appetizer.price, specifier: "%.2f")")
            .foregroundColor(.secondary)
            .fontWeight(.semibold)
        }
        .padding(.leading)
      }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
      AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}
