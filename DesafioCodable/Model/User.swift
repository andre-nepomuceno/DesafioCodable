//
//  User.swift
//  DesafioCodable
//
//  Created by André N. dos Santos on 15/06/22.
//

import Foundation
class User:  Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
}
