//
//  MessagesPageView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 26/1/2568 BE.
//

import SwiftUI

struct MessagesPageView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(1..<6) { msg in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Support Team")
                                .font(.headline)
                            Text("Your question has been answered!")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text("1d ago")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MessagesPageView()
}
