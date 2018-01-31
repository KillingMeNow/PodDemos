//
//  SnapKit_ViewController.swift
//  PodTest
//
//  Created by Apple on 2018/1/27.
//  Copyright © 2018年 gowin. All rights reserved.
//

import UIKit
import SnapKit
class SnapKit_ViewController: UIViewController {

    
    func setupview1(){
        var view1=UIView()
        view1.backgroundColor = UIColor.darkGray
        self.view.addSubview(view1)
        view1.snp.makeConstraints { (maker) in
            maker.height.equalTo(100)
            maker.left.equalTo(self.view).offset(10)
            maker.right.equalTo(self.view).offset(-10)
           // maker.leftMargin.rightMargin.equalTo(10)
            maker.centerX.equalToSuperview()
            maker.topMargin.equalTo(100)
        }
       
        var label1=UILabel()
        label1.text="距离view1=2px,距super.view的left:10,right:20"
        label1.backgroundColor=UIColor.black
        label1.textColor=UIColor.white
        label1.font=UIFont.systemFont(ofSize: 12)
        self.view.addSubview(label1)
        label1.snp.makeConstraints { (maker) in
           // maker.centerX.equalToSuperview()
            maker.height.equalTo(25)
            maker.top.equalTo(view1.snp.bottom).offset(2)
            maker.left.equalTo(self.view).offset(10)
            maker.right.equalTo(self.view).offset(-20)
        }
        
       
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview1()
        // Do any additional setup after loading the view.
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
