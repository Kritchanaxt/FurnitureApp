//
//  BottomNavBarView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 29/12/2567 BE.
//

import SwiftUI

struct BottomNavBarView: View {
    @StateObject var cartManager = CartManager()
    @State var currentTab: Tab = .Home
    @State var isShowingBottomBar: Bool = true

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $currentTab) {
                    
                    HomePageView(isShowingBottomBar: $isShowingBottomBar)
                        .environmentObject(cartManager)
                        .tag(Tab.Home)
                    
                    SearchPageView()
                        .tag(Tab.Search)
                    
                    NotificationsPageView()
                        .tag(Tab.Notifications)

                    CartPageView(isShowingBottomBar: $isShowingBottomBar)
                        .environmentObject(cartManager)
                        .tag(Tab.Basket)
                    
                    ProfilePageView()
                        .tag(Tab.Profile)
                }
                
                // Bottom Navigation Bar
                .overlay(
                    Group {
                        if isShowingBottomBar {
                            HStack(spacing: 0) {
                                ForEach(Tab.allCases, id: \.rawValue) { tab in
                                    TabButton(tab: tab)
                                }
                                .padding(.vertical)
                                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                                .background(Color("kPrimary"))
                            }
                        }
                    },
                    alignment: .bottom
                )
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
    }
    
    func TabButton(tab: Tab) -> some View {
        GeometryReader { proxy in
            Button(action: {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            }, label: {
                VStack(spacing: 0) {
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundColor(Color("kSecondary"))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack {
                                if currentTab == tab {
                                    MaterialEffect(style: .light)
                                        .clipShape(Circle())
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                    
                                    Text(tab.Tabname)
                                        .foregroundColor(.white)
                                        .font(.footnote)
                                        .padding(.top, 50)
                                        .transition(.opacity)
                                }
                            }
                        )
                        .contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -15 : 0)
                }
            })
        }
        .frame(height: 25)
    }
}


#Preview {
    BottomNavBarView()
        .environmentObject(CartManager())
}

enum Tab: String, CaseIterable {
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notifications = "bell"
    case Basket = "basket"
    case Profile = "person"
    
    var Tabname: String {
        switch self {
        case .Home:
            return "Home"
        case .Search:
            return "Serach"
        case .Notifications:
            return "Notifications"
        case .Basket:
            return "basket"
        case .Profile:
            return "Profile"
        }
    }
}

extension View {
    func getSafeArea() -> UIEdgeInsets {
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}



