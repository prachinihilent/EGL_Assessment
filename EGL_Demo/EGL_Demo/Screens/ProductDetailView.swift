//
//  ProductDetailView.swift
//  EGL_Demo
//
//  Created by Prachi Rajput on 08/12/22.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var dataModel: DataModel

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                URLImageView(urlString: dataModel.imageURL).offset(y: -200).frame(width: 150, height: 150)
                Text("\(dataModel.title ?? "")")
                    .font(.system(size: 24)).offset(y: -200)
                Text(String(format:"Price %.2f", (dataModel.price?[0].value ?? 0.0))).offset(y: -190)
                    .font(.subheadline)
                Text(String(format:"Rating %.2f", (dataModel.ratingCount))).offset(y: -180)
                    .font(.headline)
                if #available(iOS 15.0, *) {
                    Button(action: {
                        print("Added in cart")
                    }) {
                        Text("Add to cart")
                    }.buttonStyle(.borderedProminent).offset(y: -170)
                } else {
                    Button(action: {
                        print("Added in cart")
                    }) {
                        Text("Add to cart")
                    }.offset(y: -170)
                }
                
                if #available(iOS 15.0, *) {
                    Button(action: setFavourites) {
                        Label("Mark as favourite", systemImage: dataModel.isFav ? "heart.fill" : "heart")
                    }.buttonStyle(.bordered).offset(y: -160)
                } else {
                    Button(action: setFavourites) {
                        Label("Mark as favourite", systemImage: dataModel.isFav ? "heart.fill" : "heart")
                    }.offset(y: -160)
                }
            }
        }
    }
    
   private func setFavourites() {
       dataModel.isFav.toggle()
    }
}
