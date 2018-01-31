//
//  JKCountDownButton_ViewController.swift
//  PodTest
//
//  Created by Apple on 2018/1/30.
//  Copyright © 2018年 gowin. All rights reserved.
//

import UIKit
import JKCountDownButton
import SnapKit

class JKCountDownButton_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountDownButton()
        // Do any additional setup after loading the view.
    }

    func setupCountDownButton(){
        
        let btn=JKCountDownButton(type: .custom)
        self.view.addSubview(btn)
        btn.snp.makeConstraints { (mkr) in
            mkr.centerX.equalTo(self.view)
            mkr.width.equalTo(100)
            mkr.height.equalTo(40)
            mkr.top.equalTo(self.view).offset(180)
            
        }
        
        btn.setTitle("点击发送", for: .normal)
        btn.backgroundColor=UIColor.blue
        btn.countDownButtonHandler { (sender, tag) in
            sender?.isEnabled=false
            sender?.backgroundColor=UIColor.gray
            sender?.startCountDown(withSecond: 20)
            sender?.countDownChanging({ (countdownbutton, second) -> String? in
                return "剩余\(second)秒"
            })
            sender?.countDownFinished({ (button, second) -> String? in
                button?.isEnabled=true
                 btn.backgroundColor=UIColor.blue
                return "点击发送"
                
            })
        }
        
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
