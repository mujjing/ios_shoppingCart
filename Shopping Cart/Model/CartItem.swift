//
//  CartItem.swift
//  Shopping Cart
//
//  Created by 전지훈 on 2021/04/28.
//

import Foundation

class CartItem {
    
    var quantity : Int = 1
    var item : Item
    
    var subTotal : Int { get { return item.price * quantity } }
    
    init(item: Item) {
        self.item = item
    }
}
