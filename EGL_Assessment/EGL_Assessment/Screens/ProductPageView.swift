//
//  ProductPageView.swift
//  EGL_Assessment
//
//  Created by Prachi Rajput on 12/12/22.
//

import Foundation
import SwiftUI

struct ProductPageView : View {
    @ObservedObject var viewModel = ProductViewModel()

    var body: some View {
        NavigationView {
            SubviewForProducts(viewModel: viewModel).navigationTitle("Products")
        }
    }
}

struct SubviewForProducts : View {
    @ObservedObject var viewModel = ProductViewModel()

    var body : some View {
        List(viewModel.products) { product in
            NavigationLink(destination: ProductDetailView(dataModel: product)) {
                ProductCell(dataModel: product, viewModel: viewModel)
            }
        }
    }
}
