//
//  BackButoom.swift
//  E-commerceApp
//
//  Created by Kritchanat on 29/12/2567 BE.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(Color("Secondary"))
                .bold()
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)

        }
    }
}


#Preview {
    BackButton(action: {})
}
