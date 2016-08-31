//
//  FullScreenLayout.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/26/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit

struct FullScreenLayout {
    var content: Layout
    
    mutating func layoutIn(rect: CGRect) {
        content.layoutIn(rect)
    }
}
