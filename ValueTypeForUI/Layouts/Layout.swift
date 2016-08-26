//
//  Layout.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/26/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit

protocol Layout {
    var frame: CGRect { set get }
}

extension UIView: Layout {}
