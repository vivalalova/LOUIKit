//
//  LOTextfield.h
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LOTextfield : UITextField

@property (assign, nonatomic)    IBInspectable CGFloat borderWidth;
@property (assign, nonatomic)    IBInspectable UIColor *borderColor;

- (void)setup;
@end
