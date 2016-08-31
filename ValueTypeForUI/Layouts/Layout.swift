//
//  Layout.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/26/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit

protocol Layout {
    mutating func layoutIn(rect: CGRect)
}

extension UIView: Layout {
    func layoutIn(rect: CGRect) {
        frame = rect
    }
}
