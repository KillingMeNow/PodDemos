//
//  SwiftSpinner_ViewController.swift
//  PodTest
//
//  Created by Apple on 2018/1/29.
//  Copyright © 2018年 gowin. All rights reserved.
//

import UIKit
import SwiftSpinner
class SwiftSpinner_ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btn1CLick(_ sender: Any) {
        
        SwiftSpinner.show("loading")
        self.delay {
            SwiftSpinner.hide()
            
        }
    }
    
    @IBAction func btn2Click(_ sender: Any) {
        SwiftSpinner.show("Failed to connect, waiting...", animated: false)
        self.delay {
            SwiftSpinner.hide()
            
        }
    }
    
    @IBAction func btn3Click(_ sender: Any) {
        SwiftSpinner.show("loading").addTapHandler({
            SwiftSpinner.hide()
            
        }, subtitle: "点击取消")
        
    }
    @IBAction func btn4Click(_ sender: Any) {
        
        SwiftSpinner.setTitleFont(UIFont(name: "Futura", size: 22.0))
        SwiftSpinner.show("loading")
        self.delay {
            SwiftSpinner.hide()
            
        }
        
    }
    
    @IBAction func btn5Click(_ sender: Any) {
        SwiftSpinner.show("change title in 2 seconds").addTapHandler({
            SwiftSpinner.hide()
            
        }, subtitle: "点击取消")
        delay {
            SwiftSpinner.sharedInstance.title="文字改变了"
            
        }
    }
    
    @IBAction func btn6Click(_ sender: Any) {
        SwiftSpinner.show(delay: 2, title: "It's taking longer than expected")
        
    }
    
    @IBAction func btn7Click(_ sender: Any) {
        SwiftSpinner.show(duration: 2, title: "loading")
    }
    
    var thr:Thread?
    @IBAction func btn8Click(_ sender: Any) {
        
        SwiftSpinner.sharedInstance.innerColor=UIColor.red
        SwiftSpinner.sharedInstance.outerColor=UIColor.green
        SwiftSpinner.sharedInstance.backgroundColor=UIColor.brown
        thr=Thread {
            self.run()
        }
        thr?.start()
        
    }
    
    
    func run(){
        
        for i in 0...10{
            if(thr?.isCancelled)!{
                break
            }
            DispatchQueue.main.async(execute: {
                SwiftSpinner.show(progress:Double(i)/10.0 , title: "progress..\(Double(i)/10.0)%").addTapHandler({
                    self.thr?.cancel()
                    SwiftSpinner.hide()
                })
            })
            
            Thread.sleep(forTimeInterval: 0.5)
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
