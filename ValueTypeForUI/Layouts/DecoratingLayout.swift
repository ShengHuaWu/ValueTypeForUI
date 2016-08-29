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
        decoration.frame = CGRect(x: margin, y: margin, width: decorationHeight, height: decorationHeight)
        
        let interval: CGFloat = 8.0
        let contentWidth = rect.width - decoration.frame.maxX - interval - margin
        content.frame = CGRect(x: decoration.frame.maxX + interval, y: decoration.frame.minY, width: contentWidth, height: decoration.frame.height)
    }
}
