//
//  MaterialEffect.swift
//  E-commerceApp
//
//  Created by Kritchanat on 29/12/2567 BE.
//

import SwiftUI
import Foundation

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
