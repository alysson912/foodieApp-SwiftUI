//
//  String+Ext.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 01/09/25.
//

import Foundation

    //MARK: VALIDATE EMAIL REGEX

extension String {
    var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}
