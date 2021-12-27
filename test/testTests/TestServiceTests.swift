//
//  TestServiceTests.swift
//  testTests
//
//  Created by OUT-Korogodova-MM on 27.12.2021.
//

import XCTest
@testable import test

class ProductServiceTests: XCTestCase {
    
    var sut: ProductServiceProtocol!
    
    func test_applying_dicount_coupon_correct() throws {
        
        // given
        let discount = ClientCardDiscont(discountInPercent: 20)
        
        // when
        let finalPrice = sut.apply(clientCardDiscont: discount, coupon: 500)
        
        // then
        XCTAssertEqual(finalPrice, 7500)
    }
    
    func test_applying_correct_coupon_min() throws {
        
        // given
        let discount = ClientCardDiscont(discountInPercent: 20)
        
        // when
        let finalPrice = sut.apply(clientCardDiscont: discount, coupon: 1)
        
        // then
        XCTAssertEqual(finalPrice, 7999)
    }
    
    func test_applying_correct_coupon_max() throws {
        
        // given
        let discount = ClientCardDiscont(discountInPercent: 20)
        
        // when
        let finalPrice = sut.apply(clientCardDiscont: discount, coupon: 7999)
        
        // then
        XCTAssertEqual(finalPrice, 1)
    }
    
    func test_applying_correct_discount_min() throws {
        
        // given
        let discount = ClientCardDiscont(discountInPercent: 1)
        
        // when
        let finalPrice = sut.apply(clientCardDiscont: discount, coupon: 500)
        
        // then
        XCTAssertEqual(finalPrice, 9400)
    }
    
    func test_applying_correct_discount_max() throws {
        
        // given
        let discount = ClientCardDiscont(discountInPercent: 20)
        
        // when
        let finalPrice = sut.apply(clientCardDiscont: discount, coupon: 500)
        
        // then
        XCTAssertEqual(finalPrice, 7500)
    }
    
    func test_applying_incorrect_coupon_over_min() throws {
        
        // given
        let discount = ClientCardDiscont(discountInPercent: 20)
        
        // when
        let finalPrice = sut.apply(clientCardDiscont: discount, coupon: -500)
        
        // then
        XCTAssertEqual(finalPrice, 8000)
    }
    
    func test_applying_incorrect_coupon_over_max() throws {
        
        // given
        let discount = ClientCardDiscont(discountInPercent: 20)
        
        // when
        let finalPrice = sut.apply(clientCardDiscont: discount, coupon: 50000)
        
        // then
        XCTAssertEqual(finalPrice, 8000)
    }
    
    func test_applying_incorrect_discount_over_min() throws {
        
        // given
        let discount = ClientCardDiscont(discountInPercent: -20)
        
        // when
        let finalPrice = sut.apply(clientCardDiscont: discount, coupon: 500)
        
        // then
        XCTAssertEqual(finalPrice, 9400)
    }
    
    func test_applying_incorrect_discount_over_max() throws {
        
        // given
        let discount = ClientCardDiscont(discountInPercent: 200)
        
        // when
        let finalPrice = sut.apply(clientCardDiscont: discount, coupon: 500)
        
        // then
        XCTAssertEqual(finalPrice, 9400)
    }

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        sut = ProductService(price: 10000)
    }

    override func tearDownWithError() throws {
        
        sut = nil
        try super.tearDownWithError()
    }

}
