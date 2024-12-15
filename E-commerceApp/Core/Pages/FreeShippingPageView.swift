//
//  FreeShippingPageView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 26/1/2568 BE.
//

import SwiftUI

struct FreeShippingPageView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "shippingbox")
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .foregroundColor(Color("kPrimary"))
            
            Text("Free Shipping")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Enjoy free shipping on all orders over ฿500!")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Free Shipping")
    }
}

#Preview {
    FreeShippingPageView()
}
