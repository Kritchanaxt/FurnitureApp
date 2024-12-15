//
//  ImageSilderView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 15/12/2567 BE.
//

import SwiftUI

struct ImageSilderView: View {
    
    @State private var currentIndex = 0
    var sliders: [String] = ["fn1", "fn2", "fn3", "fn4", "fn5", "ch1", "ch2", "ch3", "ch4"]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack(alignment: .trailing) {
                Image(sliders[currentIndex])
                    .resizable()
                    .frame(width: .infinity, height: 170)
                    .scaledToFit()
                    .cornerRadius(15)
            }
            HStack {
                ForEach(0..<sliders.count) { index in
                    Circle()
                        .fill(self.currentIndex == index ? Color("kPrimary") : Color("kSecondary"))
                        .frame(width: 10, height: 10)
                }
            }
            .padding()
        }
        .padding()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                if self.currentIndex + 1 == self.sliders.count {
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
            }
        }
    }
}

#Preview {
    ImageSilderView()
}
