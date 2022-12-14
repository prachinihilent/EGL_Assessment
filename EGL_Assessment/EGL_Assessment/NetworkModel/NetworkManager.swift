//
//  NetworkManager.swift
//  EGL_Assessment
//
//  Created by Prachi Rajput on 11/12/22.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var loading = false
    let url = NetworkConstants.getUrl(url: APIPath.getData)
    
   public func getData(completion:@escaping ([DataModel]) -> ()) {
        self.loading = true
        if let urlStr = self.url {
            URLSession.shared.dataTask(with: urlStr) { (responseData, httpUrlResponse, error) in
                if(error == nil)
                {
                    do {
                        if let response = responseData {
                            let result = try JSONDecoder().decode(ProductsDataModel.self, from: response)
                            if let dataModels = result.products {
                                DispatchQueue.main.async {
                                    completion(dataModels)
                                    self.loading = false
                                }
                            }
                        } else {
                            debugPrint("Fatal Error")
                        }
                    } catch let decodingError {
                        debugPrint(decodingError)
                    }
                }
            }.resume()
        }
    }
}
