//
//  LOButton.h
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LOButton : UIButton

@property (nonatomic, assign) BOOL lock;
- (void)setLock:(BOOL)lock withTitle:(NSString *)title color:(UIColor *)color;

- (void)setup;

@end
