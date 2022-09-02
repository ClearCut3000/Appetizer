//
//  User.swift
//  Appetizer
//
//  Created by Николай Никитин on 03.09.2022.
//

import Foundation

struct User: Codable {
  var firstName = ""
  var lastName = ""
  var eMail = ""
  var birthdate = Date()
  var extraNapkins = false
  var frequentRefills = false
}
