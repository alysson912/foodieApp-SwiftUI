//
//  User.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 03/09/25.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate: Date = Date()
    var extraNapkins: Bool = false
    var frequentRefills: Bool = true
}
