//
//  ProfilePageView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 3/1/2568 BE.
//

import SwiftUI

struct ProfilePageView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Profile Header
                    HStack(spacing: 20) {
                        viewModel.profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                        
                        VStack(alignment: .leading) {
                            Text("\(viewModel.firstName.isEmpty ? "Unknown" : viewModel.firstName) \(viewModel.lastName.isEmpty ? "Unknown" : viewModel.lastName)")
                                .font(.title2)
                                .bold()
                                .foregroundColor(Color("kPrimary"))

                            Text(viewModel.email.isEmpty ? "No Email Provided" : viewModel.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            // Edit Profile Button
                            NavigationLink(destination: EditProfileView(viewModel: viewModel)) {
                                Text("Edit Profile")
                                    .padding()
                                    .frame(maxWidth: 120, maxHeight: 50)
                                    .background(Color("kPrimary"))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Options List
                    VStack(spacing: 10) {
                        OptionItem(icon: "heart", title: "Favourites") {
                            print("Favourites tapped")
                        }
                        OptionItem(icon: "square.and.arrow.down", title: "Downloads") {
                            print("Downloads tapped")
                        }
                        Divider()
                            .background(Color("kPrimary"))
                            .padding(.horizontal)

                        OptionItem(icon: "globe", title: "Languages") {
                            print("Languages tapped")
                        }
                        OptionItem(icon: "location", title: "Location") {
                            print("Location tapped")
                        }
                        OptionItem(icon: "tv", title: "Subscription") {
                            print("Subscription tapped")
                        }
                        OptionItem(icon: "display", title: "Display") {
                            print("Display tapped")
                        }
                        Divider()
                            .background(Color("kPrimary"))
                            .padding(.horizontal)

                        OptionItem(icon: "clock", title: "History") {
                            print("History tapped")
                        }
                        OptionItem(icon: "door.right.hand.open", title: "Log Out") {
                            print("Log Out tapped")
                        }
                        
                    }
                    .padding(.horizontal)
                    Spacer(minLength: 100)
                }
                .padding(.vertical)
            }
            .navigationTitle("My Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct OptionItem: View {
    let icon: String
    let title: String
    let action: () -> Void // Closure สำหรับการกระทำเมื่อกด
    
    var body: some View {
        Button(action: {
            action() // เรียกใช้ action เมื่อปุ่มถูกกด
        }) {
            HStack(spacing: 50) {
                Image(systemName: icon)
                    .foregroundColor(Color.blue)
                    .font(.system(size: 20))
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color("kPrimary"))
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}



#Preview {
    ProfilePageView()
}
