//
//  InsetLayout.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/31/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit

struct InsetLayout: Layout {
    var content: Layout
    let inset: UIEdgeInsets
    
    mutating func layoutIn(_ rect: CGRect) {
        let frame = UIEdgeInsetsInsetRect(rect, inset)
        
        content.layoutIn(frame)
    }
}
