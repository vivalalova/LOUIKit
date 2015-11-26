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

//shadow
@property (assign, nonatomic) IBInspectable CGFloat shadowRadius;
@property (assign, nonatomic) IBInspectable CGFloat shadowOpacity;
@property (assign, nonatomic) IBInspectable CGPoint shadowOffset;

@property (assign, nonatomic) IBInspectable BOOL circle;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;

@property (nonatomic, assign) IBInspectable NSInteger blurStyle;
@property (assign, nonatomic) IBInspectable BOOL blur;

/**
 *  gradientLayer:  gradientLayer.colors to set gradient colors
 */
@property (strong,nonatomic) NSArray <UIColor*>* gradientColors;
@property (strong, nonatomic) CAGradientLayer *gradientLayer;

- (void)setup;

@end
