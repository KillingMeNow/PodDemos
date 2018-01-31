//
//  DZNEmptyDataSet_ViewController.swift
//  PodTest
//
//  Created by Apple on 2018/1/30.
//  Copyright © 2018年 gowin. All rights reserved.
//

import UIKit
import SnapKit
import DZNEmptyDataSet
import SwiftyJSON
import MJRefresh
import AMScrollingNavbar
class DZNEmptyDataSet_ViewController: ScrollingNavigationViewController,UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
    
//    自身controller需设置autoadjustscrollview为true
//    tableiview需和self.view的frame一致
//    cell数量过少时 不会触发navibar隐藏
//    
    
    var tableview:UITableView?
    var datalist=JSON(parseJSON: "[]")
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview=UITableView(frame: CGRect.zero, style: .plain)
        self.view.addSubview(tableview!)
        
        tableview?.snp.makeConstraints({ (mkr) in
            mkr.left.right.bottom.equalTo(self.view)
            mkr.top.equalTo(self.view)//.offset(64)
            
        })
        
        tableview?.backgroundColor=UIColor.red
        self.tableview?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableview?.dataSource=self
        self.tableview?.delegate=self
        self.tableview?.emptyDataSetSource=self
        self.tableview?.emptyDataSetDelegate=self
        self.tableview?.tableFooterView=UIView()
        self.tableview?.mj_header=MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(self.loaddata))
        self.tableview?.mj_header.beginRefreshing()
        // Do any additional setup after loading the view.
    }
    var hasdata=true
    func loaddata(){
        self.delay {
            self.hasdata = !self.hasdata
            if(self.hasdata){
                self.datalist=JSON(parseJSON: "[{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}]")
                print(self.datalist.count)
            }
            else{
                self.datalist=JSON(parseJSON: "[]")
            }
            self.tableview?.mj_header.endRefreshing()
            self.tableview?.reloadData()
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(tableview!, delay: 0.0, followers: [])
            navigationController.scrollingNavbarDelegate = self
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
extension DZNEmptyDataSet_ViewController{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("datalist.count=\(self.datalist.count)")
        return self.datalist.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //var cell=self.tableview.dequeueReusableCell(withIdentifier: "cell")
        //if(!(cell != nil)){
        var cell=UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
         cell.textLabel?.text = "Row \((indexPath as NSIndexPath).row + 1)"
        //}
        
        
        return cell
    }
    
}

extension DZNEmptyDataSet_ViewController{
    
    func emptyDataSetWillAppear(_ scrollView: UIScrollView!) {
        
//        - (void)emptyDataSetWillAppear:(UIScrollView *)scrollView {
//            [UIView animateWithDuration:0.5 animations:^{
//                scrollView.contentOffset = CGPointZero;
//                }];
//        }
        UIView.animate(withDuration: 0.5) { 
            
         scrollView.contentOffset=CGPoint.zero
            
        }
        
    }
    
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
        return UIColor.white
        
    }
//    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
//        return -80
//    }
    //占位图的点击事件
    func emptyDataSet(_ scrollView: UIScrollView!, didTap view: UIView!) {
        print("tap view=\(view)")
        print("空白视图被点击")
         self.tableview?.mj_header.beginRefreshing()
    }
}

extension DZNEmptyDataSet_ViewController: ScrollingNavigationControllerDelegate {
    func scrollingNavigationController(_ controller: ScrollingNavigationController, willChangeState state: NavigationBarState) {
        view.needsUpdateConstraints()
    }
}
