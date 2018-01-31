//
//  Siren_ViewController.swift
//  PodTest
//
//  Created by Apple on 2018/1/24.
//  Copyright © 2018年 gowin. All rights reserved.
//

import UIKit
import Siren
class Siren_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
setupSiren()
        // Do any additional setup after loading the view.
    }

    func setupSiren() {
        let siren = Siren.shared
        
        // Optional
        siren.delegate = self
        
        // Optional
        siren.debugEnabled = true
        
        // Optional - Change the name of your app. Useful if you have a long app name and want to display a shortened version in the update dialog (e.g., the UIAlertController).
        //        siren.appName = "Test App Name"
        
        // Optional - Change the various UIAlertController and UIAlertAction messaging. One or more values can be changes. If only a subset of values are changed, the defaults with which Siren comes with will be used.
        //        siren.alertMessaging = SirenAlertMessaging(updateTitle: "New Fancy Title",
        //                                                   updateMessage: "New message goes here!",
        //                                                   updateButtonMessage: "Update Now, Plz!?",
        //                                                   nextTimeButtonMessage: "OK, next time it is!",
        //                                                   skipVersionButtonMessage: "Please don't push skip, please don't!")
        
        // Optional - Defaults to .Option
        //        siren.alertType = .option // or .force, .skip, .none
        
        // Optional - Can set differentiated Alerts for Major, Minor, Patch, and Revision Updates (Must be called AFTER siren.alertType, if you are using siren.alertType)
        siren.majorUpdateAlertType = .option
        siren.minorUpdateAlertType = .option
        siren.patchUpdateAlertType = .option
        siren.revisionUpdateAlertType = .option
        siren.forceLanguageLocalization = Siren.LanguageType.ChineseSimplified
        
        // Optional - Sets all messages to appear in Russian. Siren supports many other languages, not just English and Russian.
        //        siren.forceLanguageLocalization = .russian
        
        // Optional - Set this variable if your app is not available in the U.S. App Store. List of codes: https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/iTunesConnect_Guide/Chapters/AppStoreTerritories.html
        //        siren.countryCode = ""
        
        // Optional - Set this variable if you would only like to show an alert if your app has been available on the store for a few days.
        // This default value is set to 1 to avoid this issue: https://github.com/ArtSabintsev/Siren#words-of-caution
        // To show the update immediately after Apple has updated their JSON, set this value to 0. Not recommended due to aforementioned reason in https://github.com/ArtSabintsev/Siren#words-of-caution.
        //        siren.showAlertAfterCurrentVersionHasBeenReleasedForDays = 3
        
        // Optional (Only do this if you don't call checkVersion in didBecomeActive)
        //        siren.checkVersion(checkType: .immediately)
    }
    
    @IBAction func CheckVersionClick(_ sender: Any) {
      
        Siren.shared.checkVersion(checkType: .immediately)

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
extension Siren_ViewController: SirenDelegate
{
    func sirenDidShowUpdateDialog(alertType: Siren.AlertType) {
        print(#function, alertType)
    }
    
    func sirenUserDidCancel() {
        print(#function)
    }
    
    func sirenUserDidSkipVersion() {
        print(#function)
    }
    
    func sirenUserDidLaunchAppStore() {
        print(#function)
    }
    
    func sirenDidFailVersionCheck(error: Error) {
        print(#function, error)
    }
    
    func sirenLatestVersionInstalled() {
        print(#function, "Latest version of app is installed")
    }
    
    // This delegate method is only hit when alertType is initialized to .none
    

    func sirenDidDetectNewVersionWithoutAlert(message: String) {
        print(#function, "\(message).\n")
    }
}
