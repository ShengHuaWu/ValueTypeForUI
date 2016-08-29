//
//  DecoratingLayoutTests.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/29/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import XCTest
@testable import ValueTypeForUI

class DecoratingLayoutTests: XCTestCase {
    // MARK: - Enabled Tests
    func testLayout() {
        let rect = CGRect(x: 10.0, y: 20.0, width: 100.0, height: 50.0)
        let mockDecoration = MockView()
        let mockContent = MockView()
        
        var decoratingLayout = DecoratingLayout(content: mockContent, decoration: mockDecoration)
        decoratingLayout.layoutIn(rect)

        XCTAssertNotEqual(mockDecoration.frame, CGRect.zero)
        XCTAssertEqual(mockDecoration.frame.width, mockDecoration.frame.height)
        XCTAssertEqual(mockContent.frame.height, mockDecoration.frame.height)
    }
}
