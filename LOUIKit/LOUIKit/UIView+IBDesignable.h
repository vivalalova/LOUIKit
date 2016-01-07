//
//  UIView+IBDesignable.h
//  LOUIKit
//
//  Created by Kuo-HsunShih on 2016/1/7.
//  Copyright © 2016年 LO. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIView (IBDesignable)

@property (nonatomic, assign) IBInspectable BOOL roundForm;
@property (nonatomic, assign) IBInspectable BOOL masksToBounds;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic, strong) IBInspectable UIColor *shadowColor;
@property (nonatomic, assign) IBInspectable CGFloat shadowOpacity;
@property (nonatomic, assign) IBInspectable CGFloat shadowRadius;
@property (nonatomic, assign) IBInspectable CGSize shadowOffset;


/**
 *  0 -> UIBlurEffectStyleExtraLight
 *  1 -> UIBlurEffectStyleLight
 *  2 -> UIBlurEffectStyleDark
 *  else -> disable
 */
@property (nonatomic, assign) IBInspectable int blurStyle;


/**
 *  gradientLayer:  gradientLayer.colors to set gradient colors
 */
@property (strong, nonatomic) NSArray <UIColor *> *gradientColors;



@end
