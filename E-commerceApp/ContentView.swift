//
//  ContentView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 15/12/2567 BE.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        BottomNavBarView()
    }
}

#Preview {
    ContentView()
}

