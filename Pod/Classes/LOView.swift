//
//  LOView.swift
//  Pods
//
//  Created by Kuo-HsunShih on 2016/9/25.
//
//

import UIKit

public class LOView: UIView {
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setup()
    }
    
    func setup() {
        self.setShadow()
    }
    
    func setShadow() {
        self.layer.shadowRadius = self.shadowRadius!
        self.layer.shadowOffset = self.shadowOffset!
        self.layer.shadowOpacity = self.shadowOpacity!
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.shadowRadius!).cgPath
    }
}

extension LOView:LOViewProtocol {
    @IBInspectable var shadowRadius:CGFloat?{
        get{
            return self.layer.shadowRadius
        }
        set{
            self.layer.shadowRadius = newValue ?? 0
        }
    }
    
    @IBInspectable var shadowOpacity:Float?{
        get{
            return self.layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue ?? 0
        }
    }
    
    @IBInspectable var shadowOffset:CGSize?{
        get{
            return self.layer.shadowOffset
        }
        set{
            self.layer.shadowOffset = newValue ?? CGSize()
        }
    }
    
    @IBInspectable var circle:Bool?{
        get{
            return circle
        }
        set{
            circle = newValue
            
            if circle ?? false {
                self.layer.cornerRadius = self.frame.size.height / 2
            }
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat?{
        get{
            return self.layer.cornerRadius
        }
        set{
            if circle == false {
                self.layer.cornerRadius = newValue ?? 0
            }
        }
    }
    
    @IBInspectable var borderColor:UIColor?{
        get{
            return UIColor(cgColor:self.layer.borderColor!)
        }
        set{
            self.layer.borderColor = newValue?.cgColor ?? UIColor.clear.cgColor
        }
    }
    
    @IBInspectable var borderWidth:CGFloat?{
        get{
            return borderWidth
        }
        set{
            self.layer.borderWidth = newValue ?? 0
        }
    }
    
//    @IBInspectable var blurStyle:NSInteger?{
//        get{
//            return blurStyle
//        }
//        set{
//            
//        }
//    }
//    
//    @IBInspectable var blur:Bool?{
//        get{
//            return blur
//        }
//        set{
//            
//        }
//    }
}
