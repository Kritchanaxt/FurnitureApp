//
//  SearchView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 15/12/2567 BE.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    @State private var searchResults: [Product] = [] // ผลลัพธ์ของการค้นหา
    private let sampleData: [Product] = productList // ข้อมูลผลิตภัณฑ์ที่ใช้ค้นหา
    
    @EnvironmentObject var cartManager: CartManager
    @Binding var isShowingBottomBar: Bool

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("kPrimary"))
                    .padding(.leading)
                
                TextField("Search For Furniture...", text: $searchText)
                    .frame(width: 200)
                    .padding(.vertical)
                    .onChange(of: searchText) { _ in
                    }
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
            
            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color("kPrimary"))
                .cornerRadius(12)
            
            
            Spacer()
            
            NavigationLink(destination: CartPageView(isShowingBottomBar: $isShowingBottomBar)
                .environmentObject(cartManager)
            ) {
                CartButton(numberOfProducts: cartManager.products.count)
            }
        }
        .padding(.horizontal)
        
    }
    
}

#Preview {
    @State var isShowingBottomBar = true
    return SearchView(isShowingBottomBar: $isShowingBottomBar)
        .environmentObject(CartManager())
}
