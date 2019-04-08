//
//  MasterViewModel_Tests.swift
//  DemoTests
//
//  Created by Walter Fettich on 08/04/2019.
//  Copyright © 2019 Walter Fettich. All rights reserved.
//

import XCTest

class MasterViewModel_Tests: XCTestCase {

    var m:MasterViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        m = MasterViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdd_Remove() {
        let o = ModelObject.dummy()
        m.addObject(o)
        XCTAssertTrue(m.objects[0] == o)
        m.remove(at: 0)
        XCTAssertTrue(m.objects.count == 0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
