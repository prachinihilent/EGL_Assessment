//
//  DataModel.swift
//  EGL_Demo
//
//  Created by Prachi Rajput on 07/12/22.
//

import Foundation
import SwiftUI

struct ProductsDataModel: Codable {
    var products: [DataModel]?
    enum CodingKeys: String, CodingKey {
        case products = "products"
    }
}
class DataModel: Codable, ObservableObject, Identifiable {
    public var title: String?
    public var id: String = ""
    public var imageURL: String?
    public var price: [PriceModel]?
    var brand: String?
    public var isAddToCartEnable: Bool?
    var badges: [String]?
    public var ratingCount: Double = 0.0
    public var message: messageModel?
    var addToCartButtonText: String?
    var isInTrolley: Bool?
    var isInWishlist: Bool?
    var isFindMeEnable: Bool?
    var saleUnitPrice: Double?
    var totalReviewCount: Int?
    var isDeliveryOnly: Bool?
    var isDirectFromSupplier: Bool?
    @Published var isFav: Bool = false
    enum CodingKeys: String, CodingKey {
        case title, id,imageURL, price, brand, isAddToCartEnable, badges,ratingCount,message, addToCartButtonText, isInTrolley, isInWishlist, isFindMeEnable, saleUnitPrice, totalReviewCount, isDeliveryOnly
        case isDirectFromSupplier = "isDirectFromSupplier"
    }
}

struct PriceModel: Codable {
    var message: String
    var value: Double?
    var isOfferPrice: Bool
    enum CodingKeys: String, CodingKey {
        case message, value, isOfferPrice = "isOfferPrice"
    }
}
struct messageModel: Codable {
    var secondaryMessage: String
    var sash: [String]?
    enum CodingKeys: String, CodingKey {
        case secondaryMessage, sash = "sash"
    }
}
