//
//  testTests.swift
//  testTests
//
//  Created by OUT-Korogodova-MM on 31.08.2021.
//

import XCTest
@testable import test

class testTests: XCTestCase {
    
    var sut: URLSession!
    
    func testgetPostsData() {
        
        // given
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=3LomLzdjD0yDLoWaZq80ptocSS1VBHrhFb6jE261&count=6")!
        let promise = expectation(description: "Status code: 200")
        
        // when
        sut.dataTask(with: url) { _, response, error in
            
        // then
            if let error = error {
                
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                
                if statusCode == 200 {
                    
                    promise.fulfill()
                } else {
                    
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }.resume()
        wait(for: [promise], timeout: 5)
    }
    
    func testApiCallCompletes() throws {
        
        // given
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=3LomLzdjD0yDLoWaZq80ptocSS1VBHrhFb6jE261&count=6")!
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // when
        sut.dataTask(with: url) { _, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }.resume()
        wait(for: [promise], timeout: 5)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }

    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

}
