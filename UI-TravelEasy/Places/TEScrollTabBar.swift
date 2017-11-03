//
//  TEScrollTabBar.swift
//  UI-TravelEasy
//
//  Created by MengHsiu Chang on 03/11/2017.
//  Copyright © 2017 shou. All rights reserved.
//

import UIKit

class TEScrollTabBar: UIView {
    
    
    var collectionView: UICollectionView!
    
    
    init(_ titles:[String]) {
        super.init(frame: CGRect.zero)
        
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
