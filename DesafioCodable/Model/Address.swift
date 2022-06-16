//
//  Address.swift
//  DesafioCodable
//
//  Created by André N. dos Santos on 15/06/22.
//

import Foundation
class Address: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo
}
