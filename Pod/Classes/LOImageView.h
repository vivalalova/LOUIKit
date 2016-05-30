//
//  LOImageView.h
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LOImageView : UIImageView

@property (assign, nonatomic) IBInspectable BOOL circle;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
@property (assign, nonatomic) IBInspectable BOOL renderingTemplate;
- (void)setup;

@end
