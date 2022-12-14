//
//  EGL_AssessmentTests.swift
//  EGL_AssessmentTests
//
//  Created by Prachi Rajput on 07/12/22.
//

import XCTest
@testable import EGL_Assessment

final class EGL_AssessmentTests: XCTestCase {
    let viewModel = ProductViewModel()

    func testSuccessfulApiResponse() async {
        await viewModel.getProductsApiCall()
        sleep(3)
        XCTAssertTrue(viewModel.products.count > 0)
    }
    
    func testCheckForPrice() async {
        await viewModel.getProductsApiCall()
        sleep(3)
        let products =  viewModel.getProducts()
        let result = products[0].price
        XCTAssertNotNil(result)
        XCTAssertGreaterThan(result?[0].value ?? 0.0, 0.0)
    }
    
    func testCheckForFavKey() async {
        await viewModel.getProductsApiCall()
        sleep(3)
        let products =  viewModel.getProducts()
        let result = products[0].isFav
        XCTAssertNotNil(result)
    }
}
