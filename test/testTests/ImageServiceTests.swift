//
//  ImageServiceTests.swift
//  testTests
//
//  Created by OUT-Korogodova-MM on 26.12.2021.
//

import XCTest
@testable import test

class ImageServiceTests: XCTestCase {
    
    var sut: ImagesServiceProtocol!
    
    // все параметры корректны
    func test_load_image_success() throws {
        
        // given
        let url = URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/1-cowvr-loaded-1041.jpg")!
        
        // when
        
        sut.loadImage(url: url) { result in
            
            // then
            switch result {
            case .success(let image):
                XCTAssertNotNil(image.cgImage)
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
    }
    
    func test_load_image_fail() throws {
        
        // given
        let url = URL(string: "https://www.nasasites/default/files/thumbnails/image/1-cowvr-loaded-1")!
        let asyncExpectation = expectation(description: "addChildIsWorkingFunction")
        
        // when
        sut.loadImage(url: url) { result in
            asyncExpectation.fulfill()
            
            // then
            switch result {
            case .success(let image):
                XCTAssertNotNil(image.cgImage)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ImageService()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

}
