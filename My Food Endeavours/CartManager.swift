//
//  CartManager.swift
//  My Food Endeavours
//
//  Created by Dr Lubna Zaheer yousafi on 13/12/2023.
//

import Foundation

class CartManager {
    static let shared = CartManager()
    private(set) var cartItems: [String] = []

    private init() {}

    func addItems(items: [String]) {
        for item in items where !cartItems.contains(item) {
            cartItems.append(item)
        }
    }

    func clearCart() {
        cartItems.removeAll()
    }
}

