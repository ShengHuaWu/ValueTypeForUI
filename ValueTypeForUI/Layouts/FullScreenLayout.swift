//
//  FullScreenLayout.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/26/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit

struct FullScreenLayout {
    let content: UIView
    
    func layoutIn(rect: CGRect) {
        content.frame = rect
    }
}
