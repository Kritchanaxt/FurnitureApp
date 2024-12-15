//
//  PaymentPageView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 26/1/2568 BE.
//

import SwiftUI

struct PaymentPageView: View {
    @State private var currentStep: PaymentStep = .selectMethod
    @State private var selectedPaymentMethod: PaymentMethod = .creditCard
    @State private var cardNumber: String = ""
    @State private var cardHolderName: String = ""
    @State private var expirationDate: String = ""
    @State private var cvv: String = ""
    
    var body: some View {
        ZStack {
          Color("Bg")
            .ignoresSafeArea()
            
            VStack {
                if currentStep == .selectMethod {
                    SelectMethodView(selectedPaymentMethod: $selectedPaymentMethod) {
                        withAnimation {
                            currentStep = .enterDetails
                        }
                    }
                } else if currentStep == .enterDetails {
                    EnterDetailsView(
                        cardNumber: $cardNumber,
                        cardHolderName: $cardHolderName,
                        expirationDate: $expirationDate,
                        cvv: $cvv
                    ) {
                        withAnimation {
                            currentStep = .paymentSuccess
                        }
                    }
                } else if currentStep == .paymentSuccess {
                    PaymentSuccessView {
                        withAnimation {
                            currentStep = .selectMethod
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PaymentPageView()
}

//#Preview {
//    @State var cardNumber = ""
//    @State var cardHolderName = ""
//    @State var expirationDate = ""
//    @State var cvv = ""
//
//    return EnterDetailsView(
//        cardNumber: $cardNumber,
//        cardHolderName: $cardHolderName,
//        expirationDate: $expirationDate,
//        cvv: $cvv,
//        onPay: {
//            print("Payment Processed")
//        }
//    )
//}

// MARK: - Select Method View
struct SelectMethodView: View {
    @Binding var selectedPaymentMethod: PaymentMethod
    var onContinue: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Text("฿500.00")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
            Text("Goods and Services")
                .foregroundColor(Color("kPrimary").opacity(0.8))
                .font(.subheadline)
            
            Text("Pay with")
                .font(.title2.bold())
                .foregroundColor(.black)
            
            VStack(spacing: 15) {
                PaymentMethodRow(
                    method: .creditCard,
                    isSelected: selectedPaymentMethod == .creditCard
                ) {
                    selectedPaymentMethod = .creditCard
                }
                PaymentMethodRow(
                    method: .bankTransfer,
                    isSelected: selectedPaymentMethod == .bankTransfer
                ) {
                    selectedPaymentMethod = .bankTransfer
                }
            }
            
            Button(action: onContinue) {
                Text("Select")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct PaymentMethodRow: View {
    let method: PaymentMethod
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: method.iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(isSelected ? .white : .gray)
            
            Text(method.displayName)
                .font(.headline)
                .foregroundColor(isSelected ? .white : .gray)
            
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(isSelected ? Color.black.opacity(0.8) : Color.white)
        .cornerRadius(10)
        .onTapGesture(perform: onTap)
    }
}

// MARK: - Enter Details View
struct EnterDetailsView: View {
    @Binding var cardNumber: String
    @Binding var cardHolderName: String
    @Binding var expirationDate: String
    @Binding var cvv: String
    var onPay: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("฿500.00")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
            Text("Goods and Services")
                .foregroundColor(Color("kPrimary").opacity(0.8))
                .font(.subheadline)
            
            CreditCardForm(
                cardNumber: $cardNumber,
                cardHolderName: $cardHolderName,
                expirationDate: $expirationDate,
                cvv: $cvv
            )
            .padding(.horizontal)
            
            Button(action: onPay) {
                Text("Pay")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Secondary"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

// MARK: - Payment Success View
struct PaymentSuccessView: View {
    var onDone: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.green)
            
            Text("Payment Successful!")
                .font(.title.bold())
                .foregroundColor(Color.black)
            
            Button(action: onDone) {
                Text("Done")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("kPrimary"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - Payment Method Enum
enum PaymentMethod: String, CaseIterable {
    case creditCard
    case bankTransfer
    
    var displayName: String {
        switch self {
        case .creditCard: return "Credit or Debit Card"
        case .bankTransfer: return "Pay by Bank"
        }
    }
    
    var iconName: String {
        switch self {
        case .creditCard: return "creditcard.fill"
        case .bankTransfer: return "building.columns.fill"
        }
    }
}

enum PaymentStep {
    case selectMethod
    case enterDetails
    case paymentSuccess
}

struct CreditCardForm: View {
    @Binding var cardNumber: String
    @Binding var cardHolderName: String
    @Binding var expirationDate: String
    @Binding var cvv: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {

            Text("Card Number")
                .font(.headline)
                .foregroundColor(.black)
            TextField("Enter your card number", text: $cardNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            
            Text("Card Holder Name")
                .font(.headline)
                .foregroundColor(.black)
            TextField("Enter card holder name", text: $cardHolderName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Expiration Date")
                .font(.headline)
                .foregroundColor(.black)
            TextField("MM/YY", text: $expirationDate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numbersAndPunctuation)
            
            Text("CVV")
                .font(.headline)
                .foregroundColor(.black)
            SecureField("Enter CVV", text: $cvv)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
        }
    }
}
