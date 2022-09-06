//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Николай Никитин on 31.08.2022.
//

import UIKit

final class NetworkManager {

  //MARK: - Properties & Singleton Init
  static let shared = NetworkManager()

  static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
  private let appetizerURL = baseURL + "appetizers"

  private let cache = NSCache<NSString, UIImage>()

  private init() {}

  //MARK: - Methods

  #warning("Old stuff")
  /*
   func getAppetizers(completion: @escaping (Result<[Appetizer], APError> ) -> Void) {
   guard let url = URL(string: appetizerURL) else {
   completion(.failure(APError.invalidURL))
   return
   }
   let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
   guard error == nil else {
   completion(.failure(APError.unableToComplete))
   return
   }
   guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
   completion(.failure(APError.invalidResponse))
   return
   }
   guard let data = data else {
   completion(.failure(APError.invalidData))
   return
   }
   do {
   let decoder = JSONDecoder()
   let decodedResponse = try decoder.decode(AppetizerRequest.self, from: data)
   completion(.success(decodedResponse.request))
   } catch {
   completion(.failure(APError.invalidData))
   }
   }
   task.resume()
   }
   */ 

  func getAppetizers() async throws -> [Appetizer] {
    guard let url = URL(string: appetizerURL) else {
      throw APError.invalidURL
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    do {
      return try JSONDecoder().decode(AppetizerRequest.self, from: data).request
    } catch {
      throw APError.invalidData
    }
  }

  func downloadImage(from URLString: String, completion: @escaping (UIImage?) -> Void) {
    let cacheKey = NSString(string: URLString)
    if let image = cache.object(forKey: cacheKey) {
      completion(image)
      return
    }
    guard let url = URL(string: URLString) else {
      completion(nil)
      return
    }
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
      guard let data = data, let image = UIImage(data: data), error == nil else {
        completion(nil)
        return
      }
      self.cache.setObject(image, forKey: cacheKey)
      completion(image)
    }
    task.resume()
  }
}
