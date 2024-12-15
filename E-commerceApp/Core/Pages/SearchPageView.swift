//
//  SearchPageView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 31/12/2567 BE.
//

import SwiftUI

struct SearchPageView: View {
    @State private var searchText: String = ""
    @State private var searchResults: [Product] = [] // ผลลัพธ์ของการค้นหา
    private let sampleData: [Product] = productList // ข้อมูลผลิตภัณฑ์ที่ใช้ค้นหา
    
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color("Bg")
                    .ignoresSafeArea()
                
                VStack {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("kPrimary"))
                            .padding(.leading)
                        
                        TextField("Search For Furniture...", text: $searchText, onCommit: performSearch)
                            .frame(width: 300)
                            .padding(.vertical)
                            .onChange(of: searchText) { _ in performSearch() } // อัพเดตผลลัพธ์แบบเรียลไทม์
                        
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                    
                    // Search Results
                    if searchResults.isEmpty {
                        Text("No results found")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 16)], spacing: 16) {
                                ForEach(searchResults, id: \.id) { product in
                                    ProductCardView(product: product)
                                        .environmentObject(cartManager)
                                }
                            }
                            .padding()
                            
                        }
                       
                    }
                    Spacer()
                }
                .navigationTitle("Search")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }

    // Perform Search Function
    private func performSearch() {
        // Filter product data based on search text
        if searchText.isEmpty {
            searchResults = []
        } else {
            searchResults = sampleData.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.supplier.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

#Preview {
    SearchPageView()
        .environmentObject(CartManager())
}
