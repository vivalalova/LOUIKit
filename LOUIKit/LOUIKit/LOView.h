//
//  LOView.h
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE

@interface LOView : UIView

@property (assign, nonatomic) IBInspectable BOOL circle;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
@property (assign, nonatomic) IBInspectable BOOL blur;
//@property (assign, nonatomic) UIBlurEffectStyle blurEffectStyle;

//shadow
@property (assign, nonatomic) IBInspectable CGFloat shadowRadius;
@property (assign, nonatomic) IBInspectable CGFloat shadowOpacity;
@property (assign, nonatomic) IBInspectable CGSize shadowOffset;

/**
 *  gradientLayer:  gradientLayer.colors to set gradient colors
 */
@property (strong,nonatomic) NSArray <UIColor*>* gradientColors;
@property (strong, nonatomic) CAGradientLayer *gradientLayer;

- (void)setup;

@end
