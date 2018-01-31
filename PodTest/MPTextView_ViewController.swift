//
//  MPTextView_ViewController.swift
//  PodTest
//
//  Created by gowin on 2018/1/19.
//  Copyright © 2018年 gowin. All rights reserved.
//

import UIKit
import SZTextView
class MPTextView_ViewController: UIViewController {

    
    @IBOutlet weak var bgview: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets=false
        var textview=SZTextView(frame:CGRect(x: 0, y: 0, width: bgview.frame.width, height: bgview.frame.height))
        textview.isSecureTextEntry=false
        textview.textColor=UIColor.white
        textview.backgroundColor=UIColor.black
        textview.placeholder = "请输入您要反馈的内容";
        textview.placeholderTextColor = UIColor.lightGray//[UIColor lightGrayColor];
        textview.font = UIFont(name: "HelveticaNeue-Light", size: 18)//[UIFont fontWithName:@"HelveticaNeue-Light" size:18.0];
     
        self.bgview.addSubview(textview)
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
