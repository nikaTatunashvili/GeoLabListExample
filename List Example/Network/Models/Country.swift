//
//  Country.swift
//  List Example
//
//  Created by GL on 7/3/20.
//  Copyright © 2020 GL. All rights reserved.
//

import Foundation

struct Country: Codable {
    let name: String?
    let callingCodes: [String]?
    let capital: String?
    let population: Int?
    let nativeName: String?
}
