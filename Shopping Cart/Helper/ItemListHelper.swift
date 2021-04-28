//
//  ItemListHelper.swift
//  Shopping Cart
//
//  Created by 전지훈 on 2021/04/28.
//

import Foundation

class ItemListHelper {
    
    private let itemsJson = """
        [
            {
                "name": "Peas",
                "price": 100,
                "unit": "bag"
            },
            {
                "name": "Eggs",
                "price": 260,
                "unit": "dozen"
            },
            {
                "name": "Milk",
                "price": 99,
                "unit": "bottle"
            },
            {
                "name": "Beans",
                "price": 180,
                "unit": "can"
            }
        ]
        """.data(using: .utf8)!
    
    func all() -> [Item] {
        let decoder = JSONDecoder()
        let items = try! decoder.decode([Item].self, from: itemsJson)
        
        return items
    }
}
