//
//  String+AdditionsTests.swift
//  MarvelAPIListSampleTests
//
//  Created by marco.iniguez.ollero on 7/7/21.
//

import XCTest
@testable import MarvelAPIListSample

class String_AdditionsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCalculateMD5() throws {
      let md5 = "0cbc6611f5540bd0809a388dc95a615b"
      let testString = "Test"
      XCTAssertEqual(md5, testString.md5())
    }

}
