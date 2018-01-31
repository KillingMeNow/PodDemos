//
//  MultiLanguage_ViewController.swift
//  PodTest
//
//  Created by Apple on 2018/1/27.
//  Copyright © 2018年 gowin. All rights reserved.
//

import UIKit

class MultiLanguage_ViewController: UIViewController {

    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var userlanguage=UserDefaults.standard.object(forKey: "language") as? String
        if(userlanguage == nil || userlanguage == ""){
            userlanguage="zh-Hans"
        }
        LanguageHelper.shareInstance.setLanguage(langeuage: userlanguage!)
        // Do any additional setup after loading the view.
    }
    @IBAction func btnSetChinese(_ sender: Any) {
        setChinese()
    }
    @IBAction func btnsetEnglish(_ sender: Any) {
        setEnglish()
        
    }
    
    func setChinese(){
        
           LanguageHelper.shareInstance.setLanguage(langeuage: "zh-Hans")
        lbl1.text=LanguageHelper.shareInstance.getAppStr(key: "lbl1")
        lbl2.text=LanguageHelper.shareInstance.getAppStr(key: "lbl2")
        lbl3.text=LanguageHelper.shareInstance.getAppStr(key: "lbl3")
        
        
    }
    func setEnglish(){
        LanguageHelper.shareInstance.setLanguage(langeuage: "en")
        lbl1.text=LanguageHelper.shareInstance.getAppStr(key: "lbl1")
        lbl2.text=LanguageHelper.shareInstance.getAppStr(key: "lbl2")
        lbl3.text=LanguageHelper.shareInstance.getAppStr(key: "lbl3")
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
