//
//  PostServiceTest.swift
//  testTests
//
//  Created by OUT-Korogodova-MM on 23.12.2021.
//

import XCTest
@testable import test

class PostServiceTest: XCTestCase {
    
    var sut: PostsService!
    
    func testGetPostsData() throws {
        
        // given
        
        // when
        
        sut.getPostsData { result in
            switch result {
                
                // then
            case .success(_):
                XCTAssertTrue(true)
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
    }
    
    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = PostsService()
    }

    override func tearDownWithError() throws {
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

}
