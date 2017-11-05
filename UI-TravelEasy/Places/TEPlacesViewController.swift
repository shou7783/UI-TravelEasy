//
//  TEPlacesViewController.swift
//  UI-TravelEasy
//
//  Created by MengHsiu Chang on 03/11/2017.
//  Copyright © 2017 shou. All rights reserved.
//

import UIKit
import BenzeneFoundation

class TEPlacesViewController: UIViewController, TEScrollTabBarDataSource {
    
    let titles = ["Asia", "Europe", "Africa", "Oceania", "South America", "North America", "Antarctica"]
    
    var collectionView: UICollectionView!
    
    let places = ["Taiwan", "Japan", "Thailand", "China"]
    
    private let spacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        title = "Places"
        view.backgroundColor = AppTheme.Color.mainBackgroundColor
        
        // Bar
        let tabbar = TEScrollTabBar([])
        tabbar.dataSource = self
        view.addSubview(tabbar)

        tabbar.addConstraints(fromStringArray: ["H:|[$self]|", "V:|[$self(50)]"])
        
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
        collectionView.alwaysBounceVertical = true
        collectionView.register(TEPlacesCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        view.addSubview(collectionView)
        
        collectionView.addConstraints(fromStringArray: ["H:|[$self]|", "V:[$view0][$self]|"], views:[tabbar])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    // TabBar
    
    func numberOfItems(in tabBar: TEScrollTabBar) -> Int {
        return titles.count
    }
    
    func tabBar(_ tabBar: TEScrollTabBar, titleForItemAt index: Int) -> String {
        return titles[index]
    }
    
}

extension TEPlacesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TEPlacesCell
        let imageView = UIImageView(image: UIImage(named: "\(places[indexPath.row]).jpg"))
        imageView.contentMode = .scaleAspectFill
        cell.backgroundView = imageView
        cell.titleLabel.text = places[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/2 - spacing*1.5, height: 200)
    }
    
}
