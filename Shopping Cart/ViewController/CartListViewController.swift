//
//  CartListViewController.swift
//  Shopping Cart
//
//  Created by 전지훈 on 2021/04/28.
//

import UIKit

class CartListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var cart: Cart? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "카트 리스트"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let total = cart?.total else { return }
        totalPriceLabel.text = "\(total)"
    }

}


extension CartListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CartListTableViewCell else { fatalError() }
        
        if let cartItem = cart?.items[indexPath.row] {
            cell.delegate = self as CartItemDelegate
            cell.itemTitle.text = cartItem.item.name
            cell.itemPrice.text = cartItem.item.displayPrice()
            cell.countLabel.text = String(describing: cartItem.quantity)
            cell.quantity = cartItem.quantity
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension CartListViewController: CartItemDelegate {
    func updateCartItem(cell: CartListTableViewCell, quantity: Int) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        guard let cartItem = cart?.items[indexPath.row] else { return }
        
        cartItem.quantity = quantity
        
        guard let total = cart?.total else { return }
        totalPriceLabel.text = "\(total)"
    }
}
