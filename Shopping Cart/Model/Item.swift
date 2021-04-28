//
//  Item.swift
//  Shopping Cart
//
//  Created by 전지훈 on 2021/04/28.
//

import Foundation

struct Item: Codable, Equatable {
    
    var name: String
    var price: Int
    var unit: String
}

extension Item {
    // MARK: Equatable
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price && lhs.unit == rhs.unit
    }
    
    func displayPrice() -> String {
        return String.init(format: "%d per %@", price, unit)
    }
}
