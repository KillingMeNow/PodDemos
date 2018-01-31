//
//  TabbarViewController.swift
//  PodTest
//
//  Created by Apple on 2018/1/28.
//  Copyright © 2018年 gowin. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//addChildViewController(childController: HomeViewController(), title: "首页", imageName: "home")
        // Do any additional setup after loading the view.
    }

    func addChildViewController(childController: UIViewController, title: String, imageName: String) {
        // 1.添加子控制器
        // 不写该句，图片为蓝色默认，如果是在iOS8以前, 只有文字有效果, 而图片没有效果，而ios8设tintColor图片文字颜色都一样了，如果ios8前是设图片的渲染模型才能解决
        tabBar.tintColor = UIColor.orange
        
        // 1.1创建一个子控制器
        let homeVC = HomeViewController()
        // 1.2设置子控制器的相关属性
        homeVC.tabBarItem.image = UIImage(named: imageName)
        homeVC.tabBarItem.selectedImage = UIImage(named: imageName
            + "_highlighted")
        //        homeVC.tabBarItem.title = title
        //        homeVC.navigationItem.title = title
        // 系统会由内向外的设置标题
        homeVC.title = title
        
        // 1.3给子控制器包装一个导航控制器
        let nav = UINavigationController(rootViewController: homeVC)
        
        // 1.4添加
        addChildViewController(nav)
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
