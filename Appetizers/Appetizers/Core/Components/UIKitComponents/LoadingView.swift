//
//  LoadingView.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 27/08/25.
//

import UIKit
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}
    struct LoadingView: View {
        var body: some View {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()
                
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                    .scaleEffect(2)
            }
        }
    }
    
    
        
#Preview {
    LoadingView()
}
