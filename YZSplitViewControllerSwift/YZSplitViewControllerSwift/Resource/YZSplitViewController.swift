//
//  YZSplitViewController.swift
//  YZSplitViewController-Swift
//
//  Created by Broccoli on 2016/11/8.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import UIKit

class YZSplitViewController: UIViewController {
    private(set) var masterNavigationController: UINavigationController!
    private(set) var detailNavigationController: UINavigationController!
    private(set) var masterViewController: UIViewController!
    private(set) var detailViewController: UIViewController!
    
    var contentInsert = UIEdgeInsetsMake(15, 15, 15, 15)
    var masterWidth: CGFloat = 390
    var separatorWidth: CGFloat = 20
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     }

//    init(masterViewControllerClass: AnyClass, detailViewControllerClass: AnyClass) {
//        super.init(nibName: nil, bundle: nil)
//        
//        self.setMasterViewController(masterViewController: masterViewControllerClass, detailViewController: detailViewControllerClass())
//    }
    
    init(masterViewController: UIViewController, detailViewController: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        
        self.setMasterViewController(masterViewController: masterViewController, detailViewController: detailViewController)
    }
    
    func setMasterViewController(masterViewController: UIViewController, detailViewController: UIViewController? = nil) {
        masterViewController.yz_splitViewController = self
        detailViewController?.yz_splitViewController = self
        self.masterViewController = masterViewController
        self.detailViewController = detailViewController
        self.masterNavigationController = UINavigationController(rootViewController: masterViewController)
        if detailViewController != nil {
            let clearViewController = UIViewController()
            clearViewController.view.backgroundColor! = UIColor.clear
            self.detailViewController = clearViewController
        }
        self.detailNavigationController = UINavigationController(rootViewController: detailViewController!)
        self.detailNavigationController.addObserver(self, forKeyPath: "viewControllers", options: [.new, .old], context: nil)
        masterNavigationController.isNavigationBarHidden = true
        detailNavigationController.isNavigationBarHidden = true
        self.addChildViewController(self.masterNavigationController)
        self.addChildViewController(self.detailNavigationController)
        self.layoutSubview()
    }
    
    func layoutSubview() {
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor! = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
        let masterView = self.masterNavigationController.view!
        self.view.addSubview(masterView)
        
        masterView.translatesAutoresizingMaskIntoConstraints = false
        let topMasterContraint = NSLayoutConstraint(item: masterView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: self.contentInsert.top)
        let bottomMasterContraint = NSLayoutConstraint(item: masterView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -self.contentInsert.bottom)
        let leftMasterContraint = NSLayoutConstraint(item: masterView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: self.contentInsert.left)
        let widthMasterContraint = NSLayoutConstraint(item: masterView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: self.masterWidth)
        let masterViewContraints = [topMasterContraint, bottomMasterContraint, leftMasterContraint, widthMasterContraint]
        self.view.addConstraints(masterViewContraints)
        let detailView = self.detailNavigationController.view!
        self.view.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        let topDetailContraint = NSLayoutConstraint(item: detailView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: self.contentInsert.top)
        let bottomDetailContraint = NSLayoutConstraint(item: detailView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -self.contentInsert.bottom)
        let rightDetailContraint = NSLayoutConstraint(item: detailView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: -self.contentInsert.right)
        let widthDetailContraint = NSLayoutConstraint(item: detailView, attribute: .left, relatedBy: .equal, toItem: masterView, attribute: .right, multiplier: 1.0, constant: self.separatorWidth)
        let detailViewContraints = [topDetailContraint, bottomDetailContraint, rightDetailContraint, widthDetailContraint]
        self.view.addConstraints(detailViewContraints)
        self.view.setNeedsLayout()
    }
    
    // TODO: fix
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (object as! UINavigationController) == self.detailNavigationController! {
            self.detailNavigationController.topViewController!.yz_splitViewController = self
        }
    }

    deinit {
        self.detailNavigationController.removeObserver(self, forKeyPath: "viewControllers")
    }
}
