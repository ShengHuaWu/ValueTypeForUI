//
//  DecoratingLayout.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/29/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit

struct DecoratingLayout: Layout {
    var content: Layout
    var decoration: Layout
    let spacing: CGFloat
    
    mutating func layout(in rect: CGRect) {
        let decorationFrame = CGRect(x: rect.minX, y: rect.minY, width: rect.height, height: rect.height)
        decoration.layout(in: decorationFrame)
        
        let contentWidth = rect.width - decorationFrame.width - spacing
        let contentFrame = CGRect(x: decorationFrame.maxX + spacing, y: decorationFrame.minY, width: contentWidth, height: decorationFrame.height)
        content.layout(in: contentFrame)
    }
}
