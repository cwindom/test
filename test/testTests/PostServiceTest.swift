//
//  PostServiceTest.swift
//  testTests
//
//  Created by OUT-Korogodova-MM on 23.12.2021.
//

import XCTest
@testable import test

class PostServiceTests: XCTestCase {
    
    var sut: PostServiceProtocol!
    
    // все параметры корректны
    func test_load_post_success() throws {
        
        // given
        let asyncExpectation = expectation(description: "addChildIsWorkingFunction")
        
        // when
        sut.getPostsData { result in
            asyncExpectation.fulfill()
            
            // then
            switch result {
            case .success(let posts):
                XCTAssertNotNil(posts)
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_load_post_fail() throws {
        
        // given
        let asyncExpectation = expectation(description: "addChildIsWorkingFunction")
        
        // when
        sut.getPostsData { result in
            asyncExpectation.fulfill()

            // then
            switch result {
            case .success(let posts):
                XCTAssertFalse(posts.isEmpty)
                print("success")
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = PostsService()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

}
