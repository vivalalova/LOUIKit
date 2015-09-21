//
//  LOButton.h
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LOButton : UIButton

//@property (assign, nonatomic) IBInspectable UIColor* enableTitleColor;
//@property (assign, nonatomic) IBInspectable UIColor* disableTitleColor;
//@property (assign, nonatomic) IBInspectable UIColor* enableBGColor;
//@property (assign, nonatomic) IBInspectable UIColor* disableBGColor;

@property (assign, nonatomic) IBInspectable BOOL circle;

@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;

- (void)setup;

@property (nonatomic, assign) BOOL lock;
- (void)setLock:(BOOL)lock withTitle:(NSString *)title;

@end
