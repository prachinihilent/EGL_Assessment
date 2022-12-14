//
//  UrlImageModel.swift
//  EGL_Demo
//
//  Created by Prachi Rajput on 08/12/22.
//

import Foundation
import SwiftUI

class URLImageModel: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString
        self.loadImageFromUrl()
    }
    
    private func loadImageFromUrl() {
        guard let urlString = urlString else {
            return
        }
        
        guard let url = URL(string: urlString) else { return  }
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }
    
    
    private func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            return
        }
        guard let data = data else {
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            self.image = loadedImage
        }
    }
}
