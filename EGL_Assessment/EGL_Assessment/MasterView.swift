//
//  ContentView.swift
//  EGL_Assessment
//
//  Created by Prachi Rajput on 07/12/22.
//

import SwiftUI

struct MasterView : View {
    @ObservedObject var viewModel = ProductViewModel()
    
    init(viewModel: ProductViewModel = ProductViewModel()) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack {
            TabView () {
                ProductPageView(viewModel: viewModel).tabItem {
                    Image(systemName: "ellipsis.rectangle")
                    Text("Product List") }
                FavouriteProductPageView(viewModel: viewModel).tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favourites")
                }
            }
            .onAppear {
                viewModel.getProductsApiCall()
            }
            ActivityIndicatorView(isAnimating: $viewModel.networkManager.loading)
        }
    }
}
