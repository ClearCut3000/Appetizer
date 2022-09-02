//
//  String+Extension.swift
//  Appetizer
//
//  Created by Николай Никитин on 02.09.2022.
//

import Foundation

extension String {
  var isValidEmail: Bool {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: self)
  }
}
