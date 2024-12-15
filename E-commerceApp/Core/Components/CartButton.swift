//
//  CartButton.swift
//  E-commerceApp
//
//  Created by Kritchanat on 15/12/2567 BE.
//

import SwiftUI

struct CartButton: View {
    
    var numberOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "basket.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color("kPrimary"))
                .padding(5)
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
                    .background(Color("Secondary"))
                    .cornerRadius(50)
            }
        }
        .accentColor(.black)
    }
}

#Preview {
    CartButton(numberOfProducts: 1)
}
