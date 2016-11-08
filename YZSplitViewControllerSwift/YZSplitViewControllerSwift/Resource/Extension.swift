//
//  Extension.swift
//  YZSplitViewController-Swift
//
//  Created by Broccoli on 2016/11/8.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import UIKit

fileprivate var kSplitViewControllerAssociativeKey = "kSplitViewControllerAssociativeKey"

extension UIViewController {
    var yz_splitViewController: YZSplitViewController? {
        get {
            return getAssociatedObject(&kSplitViewControllerAssociativeKey) as? YZSplitViewController
        }
        
        set {
            setAssociatedObject(newValue, associativeKey:&kSplitViewControllerAssociativeKey, policy: .OBJC_ASSOCIATION_ASSIGN)
        }
    }
   
    var yz_topMasterViewController: UIViewController? {
        return self.yz_splitViewController?.masterNavigationController.topViewController
    }
    
    var yz_topDetailController: UIViewController? {
        return self.yz_splitViewController?.detailNavigationController.topViewController
    }
}

extension UINavigationController {
    func yz_replaceLast(viewController: UIViewController) {
        var viewControllers = self.viewControllers
        viewControllers.remove(at: viewControllers.index(of: viewControllers.last!)!)
        viewControllers.append(viewController)
        self.viewControllers = viewControllers
    }
}

public extension NSObject {
    func setAssociatedObject(_ value: AnyObject?, associativeKey: UnsafeRawPointer, policy: objc_AssociationPolicy) {
        if let valueAsAnyObject = value {
            objc_setAssociatedObject(self, associativeKey, valueAsAnyObject, policy)
        }
    }
    
    func getAssociatedObject(_ associativeKey: UnsafeRawPointer) -> Any? {
        guard let valueAsType = objc_getAssociatedObject(self, associativeKey) else {
            return nil
        }
        return valueAsType
    }
}
