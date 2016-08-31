//
//  VerticalLayout.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/31/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit

struct VerticalLayout: Layout {
    var contents: [Layout]
    
    mutating func layoutIn(rect: CGRect) {
        let interval: CGFloat = 8.0
        let height = (rect.height - CGFloat(contents.count - 1) * interval) / CGFloat(contents.count)
        
        for index in contents.indices {
            let frame = CGRect(x: rect.minX, y: rect.minY + CGFloat(index) * (height + interval), width: rect.width, height: height)
            contents[index].layoutIn(frame)
        }
    }
}
