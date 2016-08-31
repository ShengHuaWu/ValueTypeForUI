//
//  DecoratingCell.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/29/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit

class DecoratingCell: UITableViewCell {
    // MARK: - Lazy Initializations
    private(set) lazy var decoration: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.yellowColor()
        return imageView
    }()
    
    private(set) lazy var title: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.blueColor()
        return label
    }()
    
    private(set) lazy var subtitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.brownColor()
        return label
    }()
    
    // MARK: - Designated Initializer
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(decoration)
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let verticalLayout = VerticalLayout(contents: [title, subtitle])
        var composedLayout = DecoratingLayout(content: verticalLayout, decoration: decoration)
        composedLayout.layoutIn(contentView.bounds)
    }
}
