//
//  testTests.swift
//  testTests
//
//  Created by OUT-Korogodova-MM on 31.08.2021.
//

import XCTest
@testable import test

class testTests: XCTestCase {
    
    var instanse: PostsService!
    
    func testApplyingCoupon() {
        // Given
        var product = Product(name: "Book", price: 25)
        let requestService = PostsService()

        // When
        product.apply(coupon)

        // Then
        XCTAssertEqual(product.price, 20)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        instanse = PostsService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        instanse = nil
        try super.tearDownWithError()
    }

}
