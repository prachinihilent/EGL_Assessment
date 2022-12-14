//
//  ActivityIndicatorView.swift
//  EGL_Assessment
//
//  Created by Prachi Rajput on 12/12/22.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    @Binding var isAnimating: Bool
  public func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
   public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating == true ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
