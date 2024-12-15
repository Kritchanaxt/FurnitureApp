//
//  CategoryView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 29/12/2567 BE.
//

import SwiftUI

struct CategoryView: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? .clear : Color("kPrimary").opacity(0.5))
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color("kPrimary")]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .mask(
                            Text(text)
                                .font(.system(size: 18))
                                .fontWeight(.medium)
                        )
                    )
            
            if isActive {
                LinearGradient(
                    gradient: Gradient(colors: [Color("kPrimary"),Color("kSecondary")]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: .infinity, height: 5)
                    .clipShape(Capsule())
                    .transition(.opacity)
            }
        }
        .padding(.trailing)
    }
}

struct CategoryListView: View {
    @State private var selectedIndex: Int = 1
    
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< categories.count, id: \.self) { i in
                    Button(action: { selectedIndex = i }) {
                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CategoryListView()
}
