//
//  ProductView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 28/12/2567 BE.
//

import SwiftUI

struct ProductView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @Binding var isShowingBottomBar: Bool

    var column = [GridItem(.adaptive(minimum: 150), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .ignoresSafeArea()
    
                ScrollView {
                    LazyVGrid(columns: column, spacing: 10) {
                        ForEach(productList, id: \.id) { product in
                            NavigationLink {
                                ProductDetailsPageView(product: product)
                                    .onAppear {
                                        isShowingBottomBar = false // Hide BottomNavBar
                                    }
                                    .onDisappear {
                                        isShowingBottomBar = true // Show BottomNavBar
                                    }
                            } label: {
                                ProductCardView(product: product)
                                    .environmentObject(cartManager)
                            }
                        }
                    }
                    .padding()
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("All Furniture")
            }
        }
    }
}

#Preview {
    
    @State var isShowingBottomBar = true
    ProductView(isShowingBottomBar: $isShowingBottomBar)
        .environmentObject(CartManager())
    
}
