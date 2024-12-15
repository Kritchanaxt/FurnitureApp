//
//  CartProductView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 21/12/2567 BE.
//

import SwiftUI

struct CartProductView: View {
    
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        HStack {
            // Product image
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(8)
            
            // Product details
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                    .font(.headline)
                Text("฿\(product.price)")
                    .font(.subheadline)
                    .foregroundColor(Color("Secondary"))
                    .bold()
            }
            
            Spacer()
            
            // Quantity controls
                HStack {
                    Button(action: {
                        cartManager.removeFromCart(product: product)
                    }, label: {
                        Image(systemName: "minus")
                            .padding(.all, 8)
                    })
                    .frame(width: 30, height: 30)
                    .overlay(RoundedCorner(radius: 50).stroke())
                    .foregroundColor(.black)
                    
                    Text("1")
                        .fontWeight(.semibold)
                        .padding(.horizontal, 8)
                    
                    Button(action: {
                        cartManager.addToCart(product: product)
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(Color("kPrimary"))
                            .clipShape(Circle())
                    })
                }
        }
        .padding()
    }
}

#Preview {
    CartProductView(product: productList[2])
        .environmentObject(CartManager())
}
