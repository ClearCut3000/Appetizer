//
//  EmptyStateView.swift
//  Appetizer
//
//  Created by Николай Никитин on 03.09.2022.
//

import SwiftUI

struct EmptyStateView: View {

  //MARK: - View Properties
  let imageName: String
  let message: String

    var body: some View {
      ZStack {
        Color(.systemBackground)
          .edgesIgnoringSafeArea(.all)
        VStack {
          Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 225)
          Text(message)
            .font(.title3)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
            .padding()
        }
        .offset(y: -50)
      }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(imageName: "list", message: "Sample message")
    }
}
