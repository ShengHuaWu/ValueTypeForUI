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
        let edgeInset = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        let decorationHeight = rect.height - edgeInset.top - edgeInset.bottom
        let decorationFrame = CGRect(x: edgeInset.left, y: edgeInset.top, width: decorationHeight, height: decorationHeight)
        decoration.layoutIn(decorationFrame)
        
        let interval: CGFloat = 8.0
        let contentWidth = rect.width - decorationFrame.maxX - interval - edgeInset.right
        let contentFrame = CGRect(x: decorationFrame.maxX + interval, y: decorationFrame.minY, width: contentWidth, height: decorationFrame.height)        
        content.layoutIn(contentFrame)
    }
}
