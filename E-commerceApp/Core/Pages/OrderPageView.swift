//
//  OrderView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 26/1/2568 BE.
//

import SwiftUI

struct OrderPageView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(1..<6) { order in
                        VStack(alignment: .leading) {
                            Text("Order #2304\(order)")
                                .font(.headline)
                                .foregroundColor(Color.black)
                            
                            Text("Status: Delivered")
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(Color("Secondary"))
                        }
                        .padding(.vertical, 8)
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Your Orders")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    OrderPageView()
}
