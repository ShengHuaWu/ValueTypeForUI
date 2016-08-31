//
//  LayoutTests.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/31/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import XCTest
@testable import ValueTypeForUI

class MockView: Layout {
    private(set) var frame: CGRect
    
    init() {
        frame = .zero
    }
    
    func layoutIn(rect: CGRect) {
        frame = rect
    }
}

class LayoutTests: XCTestCase {
    // MARK: - Enable Tests
    func testLayout() {
        let rect = CGRect(x: 10.0, y: 20.0, width: 100.0, height: 50.0)
        let decoration = MockView()
        let title = MockView()
        let subtitle = MockView()
        
        let verticalLayout = VerticalLayout(contents: [title, subtitle], spacing: 8.0)
        let decoratingLayout = DecoratingLayout(content: verticalLayout, decoration: decoration, spacing: 8.0)
        var composedLayout = InsetLayout(content: decoratingLayout, inset: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0))
        composedLayout.layoutIn(rect)
        
        XCTAssertEqual(decoration.frame, CGRect(x: 18.0, y: 28.0, width: 34.0, height: 34.0))
        XCTAssertEqual(title.frame, CGRect(x: 60.0, y: 28.0, width: 42.0, height: 13.0))
        XCTAssertEqual(subtitle.frame, CGRect(x: 60.0, y: 49.0, width: 42.0, height: 13.0))
    }
}
