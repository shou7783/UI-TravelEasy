//
//  TEScrollTabBarCell.swift
//  UI-TravelEasy
//
//  Created by MengHsiu Chang on 03/11/2017.
//  Copyright © 2017 shou. All rights reserved.
//

import UIKit
import BenzeneFoundation

class TEScrollTabBarCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel = UILabel()
        titleLabel.textColor = AppTheme.Color.grayTextColor
        titleLabel.textAlignment = .center
        contentView.addSubview(titleLabel)
        titleLabel.addConstraints(fromStringArray: ["H:|[$self]|", "V:|[$self]|"])
        
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                titleLabel.textColor = AppTheme.Color.mainTextColor
            } else {
                titleLabel.textColor = AppTheme.Color.grayTextColor
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
