//
//  HelpPageView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 26/1/2568 BE.
//

import SwiftUI

struct HelpPageView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Common Questions")) {
                        Text("How to track my order?")
                        Text("How to return an item?")
                        Text("Payment options")
                    }
                    
                    Section(header: Text("Contact Us")) {
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(Color("kPrimary"))
                            Text("Call Support")
                        }
                        
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color("kPrimary"))
                            Text("Email Us")
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("Help Center")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

#Preview {
    HelpPageView()
}
