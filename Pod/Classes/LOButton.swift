//
//  LOButton.swift
//  Pods
//
//  Created by Kuo-HsunShih on 2016/11/15.
//
//

import UIKit

//protocol ButtonDelegate {
//    var isLock: Bool { get set }
//    func indicatorTag() -> Int
//}
//
//extension UIButton {
//    var delegate: ButtonDelegate? {
//        get {
//            return self
//        }
//    }
//}
//
//extension UIButton: ButtonDelegate {
//
//    internal var isLock: Bool {
//        get {
//            if self.indicator() != nil {
//                return true
//            }
//
//            return false
//        }
//        set {
//            if newValue {
//                if self.indicator() != nil {
//                    return
//                }
//
//                let indicator = UIActivityIndicatorView()
//                indicator.tag = 33795
//                indicator.startAnimating()
//
//                self.addSubview(indicator)
//
//            } else {
//                self.indicator()?.removeFromSuperview()
//            }
//        }
//    }
//
//    internal func indicatorTag() -> Int {
//        return 33795
//    }
//}
//
//fileprivate extension UIButton {
//    func indicator() -> UIActivityIndicatorView? {
//        if let indicator = viewWithTag(33795) as? UIActivityIndicatorView {
//            return indicator
//        }
//
//        return nil
//    }
//}
