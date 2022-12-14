//
//  ProductResource.swift
//  EGL_Assessment
//
//  Created by Prachi Rajput on 08/12/22.

import Foundation


class ProductViewModel: ObservableObject {
    var networkManager = NetworkManager()
    @Published var products = [DataModel]()
    @Published var favProducts = [DataModel]()

   public func getProducts() -> [DataModel] {
        return products
    }
    
   public func getFavrouites() -> [DataModel] {
        return products.filter { $0.isFav == true }
    }
    
    @MainActor
   public func getProductsApiCall() {
        networkManager.getData { products in
            self.products = products
        }
    }
}

