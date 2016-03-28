//
//  LOLabel.h
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/19.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface LOLabel : UILabel
@property (assign, nonatomic) IBInspectable BOOL blur;
@property (assign, nonatomic) IBInspectable BOOL circle;

@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (assign, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;


@property (assign, nonatomic) IBInspectable CGRect padding;

- (void)setup;

@end
