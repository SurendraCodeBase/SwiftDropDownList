//
//  DropDownListView.swift
//  DropDownList
//
//  Created by Singh, Surendra on 2/9/16.
//  Copyright © 2016 Singh, Surendra. All rights reserved.
//

import UIKit

class DropDownListView: UIView {
    
    var triangView:Annotation?
    var tableView:UITableView?
    var isActive :Bool = false
    var list :[String]?
    var titleLabal:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func drawRect(rect: CGRect) {
        
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.layer.borderWidth = 1.0
        self.userInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
        self.addGestureRecognizer(recognizer)
        
        triangView = Annotation(frame: CGRect(x:self.bounds.width - self.bounds.height, y:self.bounds.height/5 , width: self.bounds.height - self.bounds.height/2.5, height: self.bounds.height - self.bounds.height/2.5))
        
        triangView!.backgroundColor = .whiteColor()
        triangView!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        
        self.addSubview(triangView!)
        self.tableView = UITableView(frame: CGRectZero, style: .Plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.tableFooterView = UILabel(frame: CGRectZero)
        self.tableView?.rowHeight = 33
        self.titleLabal = UILabel(frame: self.bounds)
        self.titleLabal?.numberOfLines = 0
        self.titleLabal?.textAlignment = .Center
        self.titleLabal?.lineBreakMode = .ByWordWrapping
        self.addSubview(self.titleLabal!)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func handleTap(recognizer:UITapGestureRecognizer){
        
        if self.isActive == false {
            self.isActive = true
            self.triangView!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI*2))
            let globalPoint = self.superview?.convertPoint(self.frame.origin, toView: nil)
            
            let tableHieght = ((self.superview?.bounds.height)! - (globalPoint?.y)! - self.bounds.height)
            
            let height = CGFloat(self.list!.count * Int((self.tableView?.rowHeight)!)) <= tableHieght ? CGFloat(self.list!.count * Int((self.tableView?.rowHeight)!)) : tableHieght
            
            
            self.tableView?.frame = CGRectMake((globalPoint?.x)!, (globalPoint?.y)! + self.bounds.height, self.bounds.width,height )
            self.window?.addSubview(self.tableView!)
            self.tableView?.reloadData()
            
        }else{
            self.isActive = false
            self.triangView!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            self.tableView?.removeFromSuperview()
        }
    }
}

extension DropDownListView:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        if cell == nil {
            
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellId)
        }
        
        cell!.textLabel?.text = self.list![indexPath.row]
        cell?.textLabel?.textAlignment = .Center
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.titleLabal?.text = self.list![indexPath.row]
        self.isActive = false
        self.triangView!.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        self.tableView?.removeFromSuperview()
    }
}