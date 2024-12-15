//
//  ProductCardView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 15/12/2567 BE.
//

import SwiftUI

struct ProductCardView: View {
    
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        
        ZStack {
//            Color.black
//                .ignoresSafeArea()
            
            ZStack {
                Color(.white)
                
                ZStack(alignment: .bottomTrailing) {
                    VStack(alignment: .leading) {
                        Image(product.image)
                            .resizable()
                            .frame(width: 180, height: 160)
                            .cornerRadius(12)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(product.name)
                                .font(.headline)
                                .foregroundColor(Color("kPrimary"))
                            
                            Text(product.supplier)
                                .foregroundColor(Color("Primary"))
                                .font(.caption .bold())
                            
                            Text("฿ \(product.price)")
                                .foregroundColor(Color("Secondary"))
                                .bold()
                        }
                        .padding([.bottom, .horizontal])
                    }
                    
                    Button{
                        cartManager.addToCart(product: product)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(Color("kPrimary"))
                            .frame(width: 40, height: 40)
                            .padding(.trailing)
                    }
                    .padding([.bottom, .leading])
                }
            }
            .frame(width: 180, height: 260)
            .cornerRadius(15)
            .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    ProductCardView(product: productList[7])
        .environmentObject(CartManager())
}
