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
    let spacing: CGFloat
    
    mutating func layout(in rect: CGRect) {
        let height = (rect.height - CGFloat(contents.count - 1) * spacing) / CGFloat(contents.count)
        
        for index in contents.indices {
            let frame = CGRect(x: rect.minX, y: rect.minY + CGFloat(index) * (height + spacing), width: rect.width, height: height)
            contents[index].layout(in: frame)
        }
    }
}
