//
//  ViewController.swift
//  PodTest
//
//  Created by gowin on 2018/1/15.
//  Copyright © 2018年 gowin. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire
import SwiftyJSON
import DZNEmptyDataSet
class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableview.emptyDataSetSource=self
        self.tableview.emptyDataSetDelegate=self
        self.tableview.tableFooterView=UIView()
        
        
        var menulist=Bundle.main.path(forResource: "menulist.plist", ofType: nil)
        var arr=NSArray(contentsOfFile: menulist!)
        let jsonData = try! JSONSerialization.data(withJSONObject: arr, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let str:String = String(data: jsonData, encoding: String.Encoding.utf8)!
        //loaddata()\
        self.datalist=JSON(parseJSON: str)
        self.tableview.reloadData()
        

    }

    func loaddata(){
        let randomNumberTwo:Int = Int(arc4random_uniform(100))%2
        let parameters : [String : Any] = ["type": "\(randomNumberTwo)"]
        Alamofire.request("http://192.168.1.125/webservice/TEST?type=0", method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            if(response.result.isSuccess){
                self.datalist=JSON(response.result.value)
                self.tableview.reloadData()
            }
            else{
                print("获取数据解析失败")
            }

        }
        
        //.responseString { (str) in
//            print("GET_Request --> GET 请求 --> returnResult = \(str)")
//            self.datalist=JSON(parseJSON: "\(str.result.value)")
//            print("datalist=\(self.datalist.count)")
//            self.tableview.reloadData()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    var datalist=JSON(parseJSON: "[]")//JSON(parseJSON: "[{\"name\":\"MWPhotoBrowser\",\"sub\":\"一款简单的 iOS 照片浏览控件\",\"stryid\":\"MWPhotoBrowser_ViewController\"},{\"name\"}]")
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datalist.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //var cell=self.tableview.dequeueReusableCell(withIdentifier: "cell")
        //if(!(cell != nil)){
          var cell=UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        //}
        
        cell.textLabel?.text=datalist[indexPath.row]["name"].stringValue;
        cell.detailTextLabel?.text=datalist[indexPath.row]["sub"].stringValue;
    cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var id=datalist[indexPath.row]["stryid"].stringValue
        var vc=self.storyboard?.instantiateViewController(withIdentifier: id)
        vc?.title=datalist[indexPath.row]["name"].stringValue
        self.navigationController?.show(vc!, sender: self)
    }
    
}
extension ViewController:DZNEmptyDataSetSource,DZNEmptyDataSetDelegate{
    
    //设置占位图
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        var image=UIImage(named: "emptydata.png")
        return image;
    }
    //添加标题文字
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        var text = "这是一张空白页";
        var attribute = [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 18), NSForegroundColorAttributeName: UIColor.darkGray];
      return   NSAttributedString(string: text, attributes: attribute)
            }
    //添加详情文字
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        var text="您没有相关数据"
        var paragraph=NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byWordWrapping
        paragraph.alignment = NSTextAlignment.center
        var attr=[NSFontAttributeName:UIFont.boldSystemFont(ofSize: 14),NSForegroundColorAttributeName:UIColor.lightGray,NSParagraphStyleAttributeName:paragraph]
        return NSAttributedString(string: text, attributes: attr)
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return UIColor.lightGray
        
    }
    //占位图的点击事件
    func emptyDataSet(_ scrollView: UIScrollView!, didTap view: UIView!) {
        print("tap view=\(view)")
        print("空白视图被点击")
        self.loaddata()
    }
}
