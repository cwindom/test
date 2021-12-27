//
//  PresenterTests.swift
//  testTests
//
//  Created by OUT-Korogodova-MM on 23.12.2021.
//

import XCTest
@testable import test

class PresenterTests: XCTestCase {
    
    var sut: Presenter!
    
    var view: ViewInputProtocolDummy!
    
    
    func testLoadPosts() throws {
        
        // given
        let requestService = PostsService()
        
        // when
        let posts = sut.getPosts()
        
        // then
        XCTAssertEqual(requestService.posts.count, posts.count)
    }

    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = Presenter(view: view)
    }

    override func tearDownWithError() throws {
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

}
