//
//  MockView.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/26/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit
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
