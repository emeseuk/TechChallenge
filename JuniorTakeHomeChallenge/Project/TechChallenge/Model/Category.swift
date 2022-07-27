//
//  Category.swift
//  TechChallenge
//
//  Created by Emese Toth on 26/07/2022.
//

import Foundation
import SwiftUI

enum CategoryType: String {
    case all
    case food
    case health
    case entertainment
    case shopping
    case travel
}

struct Category: Hashable {
    var name: CategoryType
    let color: Color
}
