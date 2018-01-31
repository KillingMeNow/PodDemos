//
//  HomeViewController.swift
//  PodTest
//
//  Created by Apple on 2018/1/28.
//  Copyright © 2018年 gowin. All rights reserved.
//

import UIKit
import SnapKit
import  AMScrollingNavbar
class HomeViewController: ScrollingNavigationViewController,ScrollingNavigationControllerDelegate {

    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollview.snp.makeConstraints { (maker) in
            maker.top.equalTo(64)
            maker.bottom.left.right.equalTo(self.view)
            maker.bottom.equalTo(self.view).offset(-49)
        }
        
        scrollview.contentSize=CGSize(width: 375, height: 800)
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            if let tabBarController = tabBarController {
                navigationController.followScrollView(scrollview, delay: 0, scrollSpeedFactor: 2, followers: [tabBarController.tabBar])
            } else {
                navigationController.followScrollView(scrollview, delay: 0.0, scrollSpeedFactor: 2)
            }
            navigationController.scrollingNavbarDelegate = self
            navigationController.expandOnActive = false
        }

//        if let navigationController = self.navigationController as? ScrollingNavigationController{
//            navigationController.followScrollView(scrollview, delay: 2)
//            //navigationController.followScrollView((self.tabBarController?.tabBar)!, delay: 2)
//            navigationController.expandOnActive=false
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
