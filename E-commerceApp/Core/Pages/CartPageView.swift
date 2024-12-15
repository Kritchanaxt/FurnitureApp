//
//  CartView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 21/12/2567 BE.
//


import SwiftUI

struct CartPageView: View {
    @EnvironmentObject var cartManager: CartManager
    @Binding var isShowingBottomBar: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            ScrollView {
                if !cartManager.products.isEmpty {
                    VStack(spacing: 16) {
                        // Group products by their unique ID to prevent duplicates
                        let groupedProducts = Dictionary(grouping: cartManager.products, by: { $0.id })
                        
                        ForEach(groupedProducts.keys.sorted(), id: \.self) { id in
                            if let product = cartManager.products.first(where: { $0.id == id }) {
                                HStack {
                                    // Checkbox for selecting individual products
                                    Button(action: {
                                        cartManager.toggleSelection(for: product)
                                    }) {
                                        Image(systemName: cartManager.selectedItems.contains(product.id) ? "checkmark.circle.fill" : "circle")
                                            .foregroundColor(cartManager.selectedItems.contains(product.id) ? Color("Secondary") : .gray)
                                    }
                                    
                                    Image(product.image)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(8)
                                    
                                    VStack(alignment: .leading) {
                                        Text(product.name)
                                            .font(.headline)
                                        Text("฿\(product.price)")
                                            .font(.subheadline)
                                            .foregroundColor(Color("Secondary"))
                                        
                                        let quantity = cartManager.quantities[product.id] ?? 1
                                        let totalPrice = product.price * quantity
                                    }
                                    Spacer()
                                    
                                    // Quantity Controller (Button to add or remove items)
                                    HStack {
                                        Button(action: {
                                            cartManager.removeFromCart(product: product)
                                        }) {
                                            Image(systemName: "minus.circle")
                                                .foregroundColor(Color("Secondary"))
                                        }
                                        
                                        Text("\(cartManager.quantities[product.id] ?? 1)")
                                            .padding(.horizontal, 10)
                                        
                                        Button(action: {
                                            cartManager.addToCart(product: product)
                                        }) {
                                            Image(systemName: "plus.circle")
                                                .foregroundColor(.green)
                                        }
                                    }
                                }
                                Divider()
                            }
                        }
                    }
                    .padding()
                } else {
                    VStack {
                        Text("Your Cart is Empty")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.top, 50)
                    }
                }
            }
            
            // Select All Section
            HStack {
                Button(action: {
                    if cartManager.allSelected {
                        cartManager.deselectAll()
                    } else {
                        cartManager.selectAll()
                    }
                }) {
                    HStack {
                        Image(systemName: cartManager.allSelected ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(cartManager.allSelected ? Color("Secondary") : .gray)
                        Text("All")
                            .font(.headline)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    // แสดงผลราคาสินค้าที่เลือก
                    Text("฿\(String(format: "%.2f", cartManager.selectedTotalPrice))")
                           .font(.title3)
                           .foregroundColor(Color("Secondary"))
                           .bold()

                    // แสดงค่าจัดส่ง
                    Text("Shipping fee: ฿\(String(format: "%.2f", cartManager.shippingFee))")
                        .font(.subheadline)

                    // แสดงส่วนลด
                    if cartManager.discount > 0 {
                        Text("฿\(String(format: "%.2f", cartManager.discount)) off")
                            .font(.subheadline)
                            .foregroundColor(Color("Secondary"))
                    }
                }

            }
            .padding(.horizontal)

            
            // Checkout Button
            Button(action: {
                cartManager.checkout()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Checkout (\(cartManager.selectedTotalItems))")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Secondary"))
                    .cornerRadius(10)
            }
            .padding()
            .disabled(cartManager.selectedTotalItems == 0)
            Spacer(minLength: 50)
        }
        .navigationTitle("Shopping Cart (\(cartManager.totalItems))") 
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @State var isShowingBottomBar = true
    return CartPageView(isShowingBottomBar: $isShowingBottomBar)
        .environmentObject(CartManager())
}
