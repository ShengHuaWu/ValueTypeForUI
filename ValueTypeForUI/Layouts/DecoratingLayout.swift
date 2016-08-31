//
//  DecoratingLayout.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/29/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit

struct DecoratingLayout {
    var content: Layout
    var decoration: Layout
    
    mutating func layoutIn(rect: CGRect) {
        let margin: CGFloat = 8.0
        let decorationHeight = rect.height - margin * 2.0
        let decorationFrame = CGRect(x: margin, y: margin, width: decorationHeight, height: decorationHeight)
        decoration.layoutIn(decorationFrame)
        
        let interval: CGFloat = 8.0
        let contentWidth = rect.width - decorationFrame.maxX - interval - margin
        let contentFrame = CGRect(x: decorationFrame.maxX + interval, y: decorationFrame.minY, width: contentWidth, height: decorationFrame.height)
        content.layoutIn(contentFrame)
    }
}
