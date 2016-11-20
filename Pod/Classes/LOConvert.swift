//
//  LOConvert.swift
//  Pods
//
//  Created by Kuo-HsunShih on 2016/11/15.
//
//

import UIKit


class LOConvert {

    static let shard: LOConvert = {
        let instance = LOConvert()
        return instance
    }()

}


//MARK: - second level methods
extension LOConvert {
    func backgroundColorForTag(color: UIColor?) -> Int {
        guard color != nil else {
            return 0
        }


//        let cc:Int = 999999999999999999

        return 0
    }
}

//MARK: - base methods
extension LOConvert {
    func hexString(integer: Int) -> String {
        return String(integer, radix: 16)
    }

    func integer(hexString: String) -> Int {
        return Int(hexString, radix: 16) ?? 0
    }

    func hexString(color: UIColor) -> String {
        let number: Float = 255

        if let components = color.cgColor.components,
            let r = components[0] as? Float, let rInt = r * number as? Float,
            let g = components[1] as? Float, let gInt = g * number as? Float,
            let b = components[2] as? Float, let bInt = b * number as? Float {

            return String(format: "#%02lX%02lX%02lX", lroundf(rInt), lroundf(gInt), lroundf(bInt))
        }
        
        return ""
    }
}


