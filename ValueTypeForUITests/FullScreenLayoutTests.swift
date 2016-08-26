//
//  FullScreenLayoutTests.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/26/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import XCTest
@testable import ValueTypeForUI

class FullScreenLayoutTests: XCTestCase {
    // MARK: - Enabled Tests
    func testLayout() {
        let rect = CGRect(x: 10.0, y: 20.0, width: 100.0, height: 50.0)
        let mockView = MockView()
        
        var fullScreenLayout = FullScreenLayout(content: mockView)
        fullScreenLayout.layoutIn(rect)
        
        XCTAssertEqual(mockView.frame, rect)
    }
}
