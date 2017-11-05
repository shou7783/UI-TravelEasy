//
//  TEScrollTabBar.swift
//  UI-TravelEasy
//
//  Created by MengHsiu Chang on 03/11/2017.
//  Copyright © 2017 shou. All rights reserved.
//

import UIKit
import BenzeneFoundation

protocol TEScrollTabBarDelegate: NSObjectProtocol {
    
}

protocol TEScrollTabBarDataSource: NSObjectProtocol {
    func numberOfItems(in tabBar: TEScrollTabBar) -> Int
    func tabBar(_ tabBar: TEScrollTabBar, titleForItemAt index: Int) -> String
}


class TEScrollTabBar: UIView {
    
    var collectionView: UICollectionView!
    
    private static var observerContext = 0

    var selectionIndicator: UIView!
    private var selectionIndicatorConstraints: [NSLayoutConstraint]?
    
    weak var dataSource: TEScrollTabBarDataSource?
    weak var delegate: TEScrollTabBarDelegate?
    
    var font: UIFont = UIFont.boldSystemFont(ofSize: 16)

    var selectedIndex: Int! {
        didSet {
            collectionView.bringSubview(toFront: selectionIndicator)
            UIView.animate(withDuration: 0.25) {
                if let cell = self.collectionView.cellForItem(at: IndexPath(row: self.selectedIndex, section: 0)) {
                    if !cell.isSelected {
                        cell.isSelected = true
                    }
                    self.selectionIndicator.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.height - 5, width: cell.frame.size.width, height: 5)
                }
            }
        }
    }
    
    init(_ titles:[String]) {
        super.init(frame: CGRect.zero)
        
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.black
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        
        collectionView.register(TEScrollTabBarCell.self, forCellWithReuseIdentifier: "TabBarCell")
        
        addSubview(collectionView)
        collectionView.addConstraints(fromStringArray: ["H:|[$self]|", "V:|[$self]|"])
        
        
        let underLine = UIView()
        underLine.backgroundColor = UIColor(hexString: "f6f6f6").withAlphaComponent(0.3)
        addSubview(underLine)
        underLine.addConstraints(fromStringArray: ["H:|[$self]|", "V:[$self(3)]|"])
        
        
        selectionIndicator = UIView()
        selectionIndicator.backgroundColor = UIColor.orange
        collectionView.addSubview(selectionIndicator)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TEScrollTabBar: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard dataSource != nil else {
            return 0
        }
        return dataSource!.numberOfItems(in: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard dataSource != nil else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabBarCell", for: indexPath) as! TEScrollTabBarCell
        cell.titleLabel.text = dataSource!.tabBar(self, titleForItemAt: indexPath.row)
        cell.titleLabel.font = font
        
        if selectedIndex == nil {
            selectedIndex = 0
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard dataSource != nil else {
            return CGSize.zero
        }
        
        return CGSize(width: NSString(string: dataSource!.tabBar(self, titleForItemAt: indexPath.row)).boundingRect(with: CGSize(width: .greatestFiniteMagnitude, height: self.bounds.size.height),
                                                                                                                    options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                                                                                    attributes: [NSAttributedStringKey.font: font],
                                                                                                                    context: nil).size.width + 10, height: self.bounds.size.height)
    }
    
    
    // Layout
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    // Action
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
    }
}
