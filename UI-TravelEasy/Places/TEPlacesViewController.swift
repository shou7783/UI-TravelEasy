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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tabbar = TEScrollTabBar([])
        tabbar.dataSource = self
        view.addSubview(tabbar)
//
        tabbar.addConstraints(fromStringArray: ["H:|[$self]|", "V:|-50-[$self(50)]"])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func numberOfItems(in tabBar: TEScrollTabBar) -> Int {
        return titles.count
    }
    
    func tabBar(_ tabBar: TEScrollTabBar, titleForItemAt index: Int) -> String {
        return titles[index]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
