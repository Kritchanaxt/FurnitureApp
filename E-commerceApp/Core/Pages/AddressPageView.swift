//
//  Address.swift
//  E-commerceApp
//
//  Created by Kritchanat on 26/1/2568 BE.
//

import SwiftUI

struct AddressPageView: View {
    @State private var addresses: [String] = [
        "123 Main Street, Bangkok, 10200",
        "456 Sukhumvit Road, Bangkok, 10110"
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(addresses, id: \.self) { address in
                        VStack(alignment: .leading) {
                            Text(address)
                                .font(.headline)
                                .padding(.vertical, 4)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                Button(action: {
                    // Add new address action
                }) {
                    Text("Add New Address")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("kPrimary"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
            }
            .navigationTitle("Your Addresses")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

#Preview {
    AddressPageView()
}
