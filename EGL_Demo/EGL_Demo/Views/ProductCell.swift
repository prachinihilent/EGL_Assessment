//
//  ProductCell.swift
//  EGL_Demo
//
//  Created by Prachi Rajput on 08/12/22.
//

import Foundation
import SwiftUI

struct ProductCell: View {
    
    @ObservedObject var dataModel: DataModel
    @State var viewModel: ProductViewModel
    var body: some View {
        HStack {
                drawView(dataModel: dataModel, viewModel: viewModel)
        }
    }
}
struct drawView: View {
    @ObservedObject var dataModel: DataModel
    @State var viewModel: ProductViewModel

    var body: some View {
        ZStack {
            URLImageView(urlString: dataModel.imageURL).allowsHitTesting(false)
            Button {
                self.setFavourites()
            } label: {
                Image(systemName: dataModel.isFav ? "heart.fill" : "heart")
            } .allowsHitTesting(true).offset(x: -40, y: -20) .buttonStyle(BorderlessButtonStyle()).onTapGesture {}.frame(width: 80, height: 80)
        }
        VStack(alignment: .leading) {
            Text("\(dataModel.title ?? "")")
                .font(.headline)
            Text(String(format:"Price %.2f", (dataModel.price?[0].value ?? 0.0)))
                .font(.subheadline)
            Button(action: {
                print("Added in cart")
            }) {
                Text("Add to cart")
            }
        }
    }
       private func setFavourites() {
            dataModel.isFav.toggle()
           viewModel.favProducts = viewModel.getFavrouites()
        }
}
