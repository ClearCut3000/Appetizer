//
//  RemoteImage.swift
//  Appetizer
//
//  Created by Николай Никитин on 02.09.2022.
//

import SwiftUI

///Class ObservableObject for Images to load
final class ImageLoader: ObservableObject {
  //MARK: - Properties
  @Published var image: Image? = nil
  //MARK: - Methods
  func load(from URLString: String) {
    NetworkManager.shared.downloadImage(from: URLString) { uiImage in
      guard let uiImage = uiImage else { return }
      DispatchQueue.main.async {
        self.image = Image(uiImage: uiImage)
      }
    }
  }
}

///Placeholder image view helper to keep code clean
struct RemoteImage: View {
  //MARK: - Properties
  var image: Image?
  //MARK: - Methods
  var body: some View {
    image?.resizable() ?? Image("food-placeholder").resizable()
  }
}

///Used for AppetizerListCell as regular image placeholder. After onAppear happens, calls imageLoader.load
struct AppetizersRemoteImage: View {
  //MARK: - Properties
  @StateObject var imageLoader = ImageLoader()
  let URLString: String
  //MARK: - Methods
  var body: some View {
    RemoteImage(image: imageLoader.image)
      .onAppear { imageLoader.load(from: URLString) }
  }
}

