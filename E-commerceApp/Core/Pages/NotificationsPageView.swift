//
//  NotificationsPageView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 31/12/2567 BE.
//

import SwiftUI

struct Notification: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let date: Date
    var isRead: Bool
}

struct NotificationsPageView: View {
    @State private var notifications: [Notification] = [
        Notification(title: "Order Shipped", description: "Your order #23041 has been shipped.", date: Date(), isRead: false),
        Notification(title: "New Offer", description: "Get 20% off on your next purchase.", date: Date(), isRead: true),
        Notification(title: "Delivery Update", description: "Your order will arrive tomorrow.", date: Date(), isRead: false)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .ignoresSafeArea()
                
                List {
                    ForEach($notifications) { $notification in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(notification.title)
                                    .font(.headline)
                                    .foregroundColor(notification.isRead ? .gray : .black)
                                
                                Text(notification.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Text(notification.date, style: .date)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            if !notification.isRead {
                                Circle()
                                    .fill(Color("Secondary"))
                                    .frame(width: 10, height: 10)
                            }
                        }
                        .padding(.vertical, 8)
                        .onTapGesture {
                            withAnimation {
                                notification.isRead = true
                            }
                        }
                    }
                }
                .navigationTitle("Notifications")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    NotificationsPageView()
}
