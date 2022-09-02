//
//  APButton.swift
//  Appetizer
//
//  Created by Николай Никитин on 02.09.2022.
//

import SwiftUI

struct APButton: View {

  //MARK: - View Properties
  let title: LocalizedStringKey

  //MARK: - View Body
  var body: some View {
    Text(title)
      .font(.title3)
      .fontWeight(.semibold)
      .frame(width: 260, height: 50)
      .foregroundColor(.white)
      .background(Color.brandPrimary)
      .cornerRadius(10)
  }
}

struct APButton_Previews: PreviewProvider {
  static var previews: some View {
    APButton(title: "Some string sample")
  }
}
