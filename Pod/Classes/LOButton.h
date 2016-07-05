//
//  LOButton.h
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LOButton : UIButton

//shadow
@property (assign, nonatomic) IBInspectable CGFloat shadowRadius;
@property (assign, nonatomic) IBInspectable CGFloat shadowOpacity;
@property (assign, nonatomic) IBInspectable CGPoint shadowOffset;

@property (assign, nonatomic) IBInspectable BOOL circle;

@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;

- (void)setup;

@property (nonatomic, assign) BOOL lock;
- (void)setLock:(BOOL)lock withTitle:(NSString *)title color:(UIColor *)color;
@end
