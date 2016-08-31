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
        
        let verticalLayout = VerticalLayout(contents: [title, subtitle], spacing: 8.0)
        let decoratingLayout = DecoratingLayout(content: verticalLayout, decoration: decoration, spacing: 8.0)
        var composedLayout = InsetLayout(content: decoratingLayout, inset: UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0))
        composedLayout.layoutIn(contentView.bounds)
    }
}
