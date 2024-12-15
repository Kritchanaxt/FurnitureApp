//
//  AppBar().swift
//  E-commerceApp
//
//  Created by Kritchanat on 29/12/2567 BE.
//

import SwiftUI

struct AppBarView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var currentTransport: Transport = .List
    @State private var isNavigating: Bool = false

    var body: some View {
            VStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 50) {
                        ForEach(Transport.allCases, id: \.self) { transport in
                            TransportButton(transport: transport, currentTransport: $currentTransport, isNavigating: $isNavigating)
                        }
                        Spacer()
                    }
                }

                Text("Find The Most \nLuxurious")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color("kPrimary"))
                + Text(" Furniture")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color("Primary"))
            }
            .padding()
    }
}

struct TransportButton: View {
    let transport: Transport
    @Binding var currentTransport: Transport
    @Binding var isNavigating: Bool
    @State private var navigateNow: Bool = false

    var body: some View {
        VStack(spacing: 5) {
            Button(action: {
                withAnimation(.spring()) {
                    currentTransport = transport
                }
                isNavigating = true

                // หน่วงเวลาการนำทาง
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    navigateNow = true
                    isNavigating = false
                }
            }, label: {
                VStack(spacing: 5) {
                    Image(systemName: currentTransport == transport ? transport.rawValue + ".fill" : transport.rawValue)
                        .resizable()
                        .foregroundColor(currentTransport == transport ? Color("kPrimary") : Color("kPrimary"))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .frame(maxWidth: .infinity)

                    Text(transport.TransportName)
                        .foregroundColor(currentTransport == transport ? Color("kPrimary") : Color("kPrimary"))
                        .font(.footnote)
                        .padding(.top, 5)
                }
            })
            .buttonStyle(PlainButtonStyle()) // Removes default button styling
        }
        // NavigationLink สำหรับการนำทางหลังจากหน่วงเวลา
        .background(
            NavigationLink(
                destination: transport.destinationView,
                isActive: $navigateNow,
                label: { EmptyView() }
            )
            .hidden()
        )
    }
}

enum Transport: String, CaseIterable {
    case List = "list.clipboard"
    case Truck = "truck.box"
    case Message = "ellipsis.message"
    case Pin = "mappin.and.ellipse.circle"
    case Wallet = "wallet.bifold"
    case QuestionMark = "questionmark.circle"
    
    var TransportName: String {
        switch self {
        case .List: return "Orders"
        case .Truck: return "Free Shipping"
        case .Message: return "Messages"
        case .Pin: return "Address"
        case .Wallet: return "Payment"
        case .QuestionMark: return "Help"
        }
    }
    
    @ViewBuilder
    var destinationView: some View {
        switch self {
        case .List:
            OrderPageView()
        case .Truck:
            FreeShippingPageView()
        case .Message:
            MessagesPageView()
        case .Pin:
            AddressPageView()
        case .Wallet:
            PaymentPageView() 
        case .QuestionMark:
            HelpPageView()
        }
    }
}

#Preview {
    AppBarView()
        .environmentObject(CartManager())
}
