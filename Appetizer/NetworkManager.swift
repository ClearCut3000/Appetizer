//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Николай Никитин on 31.08.2022.
//

import Foundation

final class NetworkManager {

  //MARK: - Properties & Singleton Init
  static let shared = NetworkManager()

  static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
  private let appetizerURL = baseURL + "appetizers"

  private init() {}

  //MARK: - Methods
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
}
