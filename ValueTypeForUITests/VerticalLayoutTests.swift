//
//  VerticalLayoutTests.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/31/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import XCTest
@testable import ValueTypeForUI

class VerticalLayoutTests: XCTestCase {
    // MARK: - Enabled Tests
    func testLayout() {
        let rect = CGRect(x: 10.0, y: 20.0, width: 100.0, height: 50.0)
        let mockView1 = MockView()
        let mockView2 = MockView()
        
        var verticalLayout = VerticalLayout(contents: [mockView1, mockView2])
        verticalLayout.layoutIn(rect)
        
        XCTAssertEqual(mockView1.frame.height, mockView2.frame.height)
        XCTAssertEqual(mockView1.frame.width, mockView2.frame.width)
        XCTAssert(mockView1.frame.minY < mockView2.frame.midY)
    }
}
