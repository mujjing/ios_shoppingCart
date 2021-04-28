//
//  Cart.swift
//  Shopping Cart
//
//  Created by 전지훈 on 2021/04/28.
//

import Foundation

class Cart {
    
    private(set) var items : [CartItem] = []
}

extension Cart {
    
    var total: Int {
        get { return items.reduce(Int(0.0)) { value, item in
            value + item.subTotal
            }
        }
    }
    
    var totalQuantity : Int {
        get { return items.reduce(0) { value, item in
            value + item.quantity
            }
        }
    }
    
    func updateCart(with product: Item) {
        if !self.contains(product: product) {
            self.add(product: product)
        } else {
            self.remove(product: product)
        }
    }
    
    func updateCart() {
        
        for item in self.items {
            if item.quantity == 0 {
                updateCart(with: item.item)
            }
        }
    }
    
    func add(product: Item) {
        let item = items.filter { $0.item == product }
        
        if item.first != nil {
            item.first!.quantity += 1
        } else {
            items.append(CartItem(item: product))
        }
    }
    
    func remove(product: Item) {
        guard let index = items.index(where: { $0.item == product }) else { return}
        items.remove(at: index)
    }
    
    func contains(product: Item) -> Bool {
        let item = items.filter { $0.item == product }
        return item.first != nil
    }
}
