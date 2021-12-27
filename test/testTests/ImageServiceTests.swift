//
//  ImageServiceTests.swift
//  testTests
//
//  Created by OUT-Korogodova-MM on 26.12.2021.
//

import XCTest
@testable import test

class ImageServiceTests: XCTestCase {
    
    var sut: ImageService!
    
    func test_load_image_when_url_is_correct() throws {
        
        // given
        let url = URL(string: "fdg")!
        
        // when
        
        sut.loadImage(url: url) { result in
            switch result{
            case .success(let image):
                DispatchQueue.main.async() { [weak self] in
                    
                }
                print("success")
            case .failure(let error):
                // then
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
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
