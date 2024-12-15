//
//  PortfolioView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 31/12/2567 BE.
//

import SwiftUI

struct EditProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var showImagePicker: Bool = false
    

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profile Image
                ZStack {
                    viewModel.profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 170, height: 170)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .onTapGesture {
                            showImagePicker.toggle()
                        }
                }
                .overlay(
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Circle().fill(Color("kPrimary")))
                        .offset(x: -10, y: -10),
                    alignment: .bottomTrailing
                )

                // Form Fields
                Group {
                    TextField("First Name", text: $viewModel.firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    TextField("Last Name", text: $viewModel.lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Username", text: $viewModel.username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                    
                    TextField("Phone Number", text: $viewModel.phoneNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.phonePad)
                }

                // Gender and Birth Date
                HStack(spacing: 10) {
                    Picker("Gender", selection: $viewModel.gender) {
                        Text("Female")
                            .tag("Female")
                        
                        Text("Male")
                            .tag("Male")
                        
                        Text("Other ")
                            .tag("Other")
                            
                    }
                    .pickerStyle(MenuPickerStyle())

                    DatePicker("Birth Date", selection: $viewModel.birthDate, displayedComponents: .date)
                        .labelsHidden()
                }

                // Save Button
                Button(action: {
                    viewModel.saveChanges()
                }) {
                    HStack {
                        Spacer()
                        Text("Save Changes")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color("kPrimary"))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Edit Profile")
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $viewModel.profileImage)
        }
    }
}

#Preview {
    let mockViewModel = ProfileViewModel()
    EditProfileView(viewModel: mockViewModel)
}
