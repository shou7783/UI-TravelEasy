//
//  TEPlacesCell.swift
//  UI-TravelEasy
//
//  Created by MengHsiu Chang on 05/11/2017.
//  Copyright © 2017 shou. All rights reserved.
//

import UIKit

class TEPlacesCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        clipsToBounds = true
        layer.cornerRadius = 5
        layer.shouldRasterize = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
