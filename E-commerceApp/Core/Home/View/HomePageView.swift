//
//  HomePageView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 15/12/2567 BE.
//

import SwiftUI

struct HomePageView: View {
 
    @EnvironmentObject var cartManager: CartManager
    @Binding var isShowingBottomBar: Bool
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        SearchView(isShowingBottomBar: $isShowingBottomBar)
                        Spacer()
                        
                        AppBarView()
                        
                        ImageSilderView()
                        
                        CategoryListView()
                        
                        HStack {
                            Text("New Rivals")
                                .font(.title3 .bold())
//                                .fontWeight(.medium)
                                .foregroundColor(Color("kPrimary"))
                            
                            Spacer()
                            
                            NavigationLink {
                                ProductView(isShowingBottomBar: $isShowingBottomBar)
                            } label: {
                                ZStack {
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color("kPrimary").opacity(0.7), Color("Primary")]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                    .mask(
                                        Image(systemName: "circle.grid.2x2.fill")
                                            .resizable()
                                    )
                                    .frame(width: 15, height: 15)
                                }
                            }

                        }
                        .padding()

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(productList, id: \.id) { product in
                                    NavigationLink {
                                        ProductDetailsPageView(product: product)
                                            .onAppear {
                                                isShowingBottomBar = false // ซ่อน BottomNavBar
                                            }
                                            .onDisappear {
                                                isShowingBottomBar = true // แสดง BottomNavBar
                                            }
                                    } label: {
                                        ProductCardView(product: product)
                                            .environmentObject(cartManager)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        HStack {
                            Text("Popular")
                                .font(.title3 .bold())
//                                .fontWeight(.medium)
                                .foregroundColor(Color("kPrimary"))
                            
                        }
                        .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(productList, id: \.id) { product in
                                    NavigationLink {
                                        ProductDetailsPageView(product: product)
                                            .onAppear {
                                                isShowingBottomBar = false // ซ่อน BottomNavBar
                                            }
                                            .onDisappear {
                                                isShowingBottomBar = true // แสดง BottomNavBar
                                            }
                                    } label: {
                                        ProductCardView(product: product)
                                            .environmentObject(cartManager)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        Spacer(minLength: 100)
                    }
                    
                    
                }
            }
        }
        .environmentObject(cartManager)
    }
}

#Preview {
    
    @State var isShowingBottomBar = true
        return HomePageView(isShowingBottomBar: $isShowingBottomBar)
            .environmentObject(CartManager())
}


