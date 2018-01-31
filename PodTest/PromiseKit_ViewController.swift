//
//  PromiseKit_ViewController.swift
//  PodTest
//
//  Created by Apple on 2018/1/20.
//  Copyright © 2018年 gowin. All rights reserved.
//

import UIKit
import PromiseKit
class PromiseKit_ViewController: UIViewController {
   // @IBOutlet weak var consoleTxt: UITextView!
    //@IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    enum TestErr: Error {
                 case overflow
                 case invalidInput(String)
             }
    @IBAction func test1(_ sender: Any) {
        print("begin test")
        
        //链式调用
        delay1000().then { (str) -> Promise<String> in
            print("获取到delay1000返回值:\(str)")
//            return Promise{fullfill,reject in
//                //Thread.sleep(forTimeInterval: 2)
//                 fullfill("delay 2 complete")
//                //let err=TestErr.invalidInput("输入错误:\(str)")
//                //reject(err)
//            }
            return self.delay2000()
            }
            .then{(str) -> Promise<String> in
                print("获取到第二步返回:\(str)")
                 return self.delay2000()
            }
            .then { (str) -> Promise<String> in
                 print("获取到第三步返回:\(str)")
                return Promise{fullfill,reject in
                    fullfill("return right")
                }
            }
            .then { (str) -> () in
               print("获取到第四步返回:\(str)")
            }.catch { (err) in
                print("reject触发Error:\(err)")
        }
        
    }
    
    @IBAction func test2(_ sender: Any) {
     //when(fulfilled:) 只要有任何一个承诺被拒绝它就拒绝
        when(resolved: testreject(flag: false),delay1000(flag:true))
        .then{
        (str1) in
            print(",str1=\(str1)")
        }
        .catch { (err) in
            print("ERROR=\(err)")
        }.always { 
            print("self.i=\(self.i)")
            
        }
        
    }
    
    var i=0
    func testreject(flag:Bool)->Promise<String>{
        
        return Promise{
            fullfill,reject in
            Thread.sleep(forTimeInterval: 1)
            
            if(flag){
                fullfill("执行 fullfill")
            }
            else{
                let err=TestErr.invalidInput("收到false,执行reject")
                reject(err)
            }
        }
    }
    
    
    func delay1000()->Promise<String>{
        i=i+1;
        return Promise{fullfill,reject in
            //Thread.sleep(forTimeInterval: 1)
             fullfill("delay 1")
        }
    }
    
    func delay1000(flag:Bool)->Promise<String>{
        if(flag){
           
            Thread.sleep(forTimeInterval: 3)
             print("3s后第二次delay1000")
        }
        i=i+1;
        return Promise{fullfill,reject in
            //Thread.sleep(forTimeInterval: 1)
            fullfill("delay 1")
        }
    }
    
    func delay2000()->Promise<String>{
        return Promise{fullfill,reject in
            //Thread.sleep(forTimeInterval: 2)
            fullfill("delay 2 complete")
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
