//
//  XDismissButton.swift
//  Appetizer
//
//  Created by Николай Никитин on 02.09.2022.
//

import SwiftUI

struct XDismissButton: View {

  //MARK: - View Body
  var body: some View {
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
}

struct XDismissButton_Previews: PreviewProvider {
  static var previews: some View {
    XDismissButton()
  }
}
