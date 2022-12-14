//
//  URLImageView.swift
//  EGL_Demo
//
//  Created by Prachi Rajput on 08/12/22.
//

import Foundation
import SwiftUI

struct URLImageView: View {
    @ObservedObject var urlImageModel: URLImageModel
    
    init(urlString: String?) {
        urlImageModel = URLImageModel(urlString: urlString)
    }
    
    var body: some View {
        if let image = urlImageModel.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
        }
    }
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(urlString: nil)
    }
}
