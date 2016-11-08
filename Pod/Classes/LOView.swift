//
//  LOView.swift
//  Pods
//
//  Created by Kuo-HsunShih on 2016/9/25.
//
//

import UIKit

extension UIView:LOViewIBInspectable {

    @IBInspectable var borderColor:UIColor {
        get{
            let cgColor = self.layer.borderColor ?? UIColor.clear.cgColor
            return UIColor(cgColor: cgColor)
        }
        set{
            self.layer.borderColor = newValue.cgColor
        }
    }

    @IBInspectable var borderWidth:CGFloat {
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }

    @IBInspectable var shadowRadius:CGFloat {
        get{
            return self.layer.shadowRadius
        }
        set{
            self.layer.shadowRadius = newValue
        }
    }

    @IBInspectable var shadowOpacity:Float {
        get{
            return self.layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue
        }
    }

    @IBInspectable var shadowOffset:CGSize {
        get{
            return self.layer.shadowOffset
        }
        set{
            self.layer.shadowOffset = newValue
        }
    }

    @IBInspectable var cornerRadius:CGFloat {
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
