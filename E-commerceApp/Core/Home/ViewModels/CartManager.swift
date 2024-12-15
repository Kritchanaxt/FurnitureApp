//
//  CartManager.swift
//  E-commerceApp
//
//  Created by Kritchanat on 15/12/2567 BE.
//

import Foundation
import SwiftUI

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = [] // All products in the cart
    @Published private(set) var quantities: [UUID: Int] = [:] // Quantity of each product
    @Published private(set) var selectedItems: Set<UUID> = [] // Selected product IDs
    @Published private(set) var total: Int = 0 // Total price of all products

    @Published var shippingFee: Double = 39.00 // Shipping fee

    var totalItems: Int {
        return quantities.values.reduce(0) { $0 + $1 }
    }
    
    var discount: Double {
        // คำนวณราคารวมจากสินค้าที่เลือก
        let selectedTotalPrice = selectedItems.reduce(0.0) { result, id in
            let product = products.first { $0.id == id }
            let quantity = quantities[id] ?? 0
            return result + (Double(product?.price ?? 0) * Double(quantity))
        }

        // ลดราคาตามเงื่อนไขของราคารวม
        if selectedTotalPrice >= 500 {
            return 30.00 // ลด 30 บาท เมื่อราคารวมถึง 500 บาท
        } else if selectedTotalPrice >= 350 {
            return 15.00 // ลด 15 บาท เมื่อราคารวมถึง 350 บาท
        } else if selectedTotalPrice >= 200 {
            return 10.00 // ลด 10 บาท เมื่อราคารวมถึง 200 บาท
        }
        return 0.00 // ไม่มีส่วนลดหากราคารวมน้อยกว่า 200 บาท
    }

    var selectedTotalItems: Int {
        return selectedItems.reduce(0) { $0 + (quantities[$1] ?? 0) }
    }

    var totalPrice: Double {
        // หากไม่ได้เลือกสินค้าทั้งหมด ให้ราคารวมเป็น 0.00
        guard allSelected else { return 0.00 }

        // คำนวณราคารวมปกติ
        return products.reduce(0.0) { result, product in
            let quantity = quantities[product.id] ?? 0
            return result + (Double(product.price) * Double(quantity))
        }
    }

    var selectedTotalPrice: Double {
        return selectedItems.reduce(0) { result, id in
            if let product = getProductByID(id) {
                let quantity = quantities[id] ?? 0
                return result + (Double(product.price) * Double(quantity))
            }
            return result
        }
    }

    var allSelected: Bool {
        // Check if all products are selected
        return selectedItems.count == products.count
    }
    
    func getProductByID(_ id: UUID) -> Product? {
        return products.first { $0.id == id }
    }

    func addToCart(product: Product) {
        if let currentQuantity = quantities[product.id] {
            quantities[product.id] = currentQuantity + 1
        } else {
            products.append(product)
            quantities[product.id] = 1
        }
        recalculateTotal()
    }

    func removeFromCart(product: Product) {
        if let currentQuantity = quantities[product.id], currentQuantity > 1 {
            quantities[product.id] = currentQuantity - 1
        } else if let currentQuantity = quantities[product.id], currentQuantity == 1 {
            products.removeAll { $0.id == product.id }
            quantities[product.id] = nil
        }
        recalculateTotal()
    }

    func updateQuantity(product: Product, quantity: Int) {
        guard quantity > 0 else { return }
        quantities[product.id] = quantity
        recalculateTotal()
    }

    func toggleSelection(for product: Product) {
        if selectedItems.contains(product.id) {
            selectedItems.remove(product.id)
        } else {
            selectedItems.insert(product.id)
        }
    }

    func selectAll() {
        selectedItems = Set(products.map { $0.id })
    }

    func deselectAll() {
        selectedItems.removeAll()
    }

    func recalculateTotal() {
        total = products.reduce(0) { result, product in
            let quantity = quantities[product.id] ?? 0
            return result + (product.price * quantity)
        }
    }

    func checkout() {
        products.removeAll { selectedItems.contains($0.id) }
        quantities = quantities.filter { selectedItems.contains($0.key) }
        recalculateTotal()
        selectedItems.removeAll()
    }
}
