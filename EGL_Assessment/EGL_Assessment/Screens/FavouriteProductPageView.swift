//
//  FavouriteProductPageView.swift
//  EGL_Assessment
//
//  Created by Prachi Rajput on 12/12/22.
//

import Foundation
import SwiftUI

struct FavouriteProductPageView : View {
    @ObservedObject var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            SubviewForFavourites(viewModel: viewModel).navigationTitle("Favourites")
        }
    }
}

struct SubviewForFavourites : View {
    @ObservedObject var viewModel = ProductViewModel()
    
    var body : some View {
        List(viewModel.favProducts) { product in
            NavigationLink(destination: ProductDetailView(dataModel: product)) {
                ProductCell(dataModel: product, viewModel: viewModel)
            }}.onAppear {
                viewModel.favProducts = viewModel.getFavrouites()
            }
    }
}
