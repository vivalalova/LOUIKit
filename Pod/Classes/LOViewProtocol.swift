//
//  LOViewProtocol.swift
//  Pods
//
//  Created by Kuo-HsunShih on 2016/9/25.
//
//

public protocol LOViewProtocol {
    var shadowRadius: CGFloat { get set }
//    var shadowOpacity:Float {get set}
//    var shadowOffset:CGSize {get set}
//    var circle:Bool {get set}
//    var cornerRadius:CGFloat {get set}
//    var borderColor:UIColor {get set}
//    var borderWidth:CGFloat {get set}
//    var blurStyle:NSInteger? {get set}
//    var blur:Bool? {get set}
}

public extension LOViewProtocol where Self: UIView {
  
    public func getShadowRadius() -> CGFloat {
        return self.layer.shadowRadius
    }
    public func setShadowRadius(newValue:CGFloat) {
        self.layer.cornerRadius = self.shadowRadius
    }
}
