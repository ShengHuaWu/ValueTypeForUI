//
//  FullScreenLayout.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/26/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit

struct FullScreenLayout: Layout {
    var content: Layout
    
    mutating func layout(in rect: CGRect) {
        content.layout(in: rect)
    }
}
