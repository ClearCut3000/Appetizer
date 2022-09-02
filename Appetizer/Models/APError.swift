//
//  APError.swift
//  Appetizer
//
//  Created by Николай Никитин on 31.08.2022.
//

import Foundation

enum APError: Error {
  case invalidURL
  case invalidResponse
  case invalidData
  case unableToComplete
}
