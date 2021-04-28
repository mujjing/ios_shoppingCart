//
//  ItemListTableViewCell.swift
//  Shopping Cart
//
//  Created by 전지훈 on 2021/04/28.
//

import UIKit

protocol CartDelegate {
    func updateCart(cell: ItemListTableViewCell)
}

class ItemListTableViewCell: UITableViewCell {

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var delegate: CartDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addButton.layer.cornerRadius = 5
        addButton.clipsToBounds = true
        addButton.addTarget(self, action: #selector(didTabAddButton), for: .touchUpInside)
    }
    
    func setButton(state: Bool) {
        addButton.isSelected = state
        addButton.backgroundColor = (!addButton.isSelected) ? .black : .red
    }
    
    @objc func didTabAddButton() {
        setButton(state: !addButton.isSelected)
        self.delegate?.updateCart(cell: self)
    }

}
