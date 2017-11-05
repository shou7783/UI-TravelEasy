//
//  TEPlacesCell.swift
//  UI-TravelEasy
//
//  Created by MengHsiu Chang on 05/11/2017.
//  Copyright © 2017 shou. All rights reserved.
//

import UIKit

class TEPlacesCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        clipsToBounds = true
        layer.cornerRadius = 5
        layer.shouldRasterize = true
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textColor = AppTheme.Color.mainTextColor
        contentView.addSubview(titleLabel)
        titleLabel.addConstraints(fromStringArray: ["H:|-16-[$self]", "V:[$self]-20-|"])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
