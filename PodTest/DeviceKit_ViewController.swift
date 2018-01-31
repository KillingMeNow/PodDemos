//
//  DeviceKit_ViewController.swift
//  PodTest
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 gowin. All rights reserved.
//

import UIKit
import DeviceKit
class DeviceKit_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
let device=Device()
        print("curretn device is: \(device)")
        if(device == .simulator(.iPhone6)){
            print("current device is IPhone6 simulator")
        }
        
        if device.isPod {
             print("current device is isPod")
            // iPods (real or simulator)
        } else if device.isPhone {
            print("current device is isPhone")
            // iPhone (real or simulator)
        } else if device.isPad {
            print("current device is isPad")
            // iPad (real or simulator)
        }
        
        if device.isSimulator {
            print("current device is running on one of the simulators(iPod/iPhone/iPad")
            // Running on one of the simulators(iPod/iPhone/iPad)
            // Skip doing something irrelevant for Simulator
        }
        if device.batteryState == .full || device.batteryState >= .charging(75) {
            print("Your battery is happy! 😊")
        }
        
        if device.batteryLevel >= 50 {
              print("current device's batterylevel is greater than 50")
        } else {
             print("current device's batterylevel is less than 50")
        }
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
