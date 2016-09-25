//
//  LOView.swift
//  Pods
//
//  Created by Kuo-HsunShih on 2016/9/25.
//
//




import UIKit

@IBDesignable public class LOView: UIView {
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setup()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.setShadow()
    }
    
    func setup() {
        self.setShadow()
    }
    
    func setShadow() {
        self.layer.shadowRadius = self.shadowRadius
        self.layer.shadowOffset = self.shadowOffset!
        self.layer.shadowOpacity = self.shadowOpacity!
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.shadowRadius).cgPath
    }
}
extension LOView:LOViewProtocol {
    @IBInspectable public var shadowRadius:CGFloat {
        get{
            return self.getShadowRadius()
        }
        set {
            self.setShadowRadius(newValue: newValue)
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
            self.layer.shadowOffset = newValue ?? CGSize(width: 0, height: 0)
        }
    }
    
    @IBInspectable var circle:Bool?{
        get{
            return self.layer.cornerRadius == self.frame.size.height / 2
        }
        set{
            circle = newValue
            if circle == true {
                self.layer.cornerRadius = self.frame.size.height / 2
            }
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat?{
        get{
            return self.layer.cornerRadius
        }
        set{
            if circle != true {
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
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue ?? 0
        }
    }
}
