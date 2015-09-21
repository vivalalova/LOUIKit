//
//  LOTextView.h
//  Pamperologist
//
//  Created by ShihKuo-Hsun on 2015/4/2.
//  Copyright (c) 2015年 Pamperologist. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE

@interface LOTextView : UITextView
@property (assign, nonatomic)    IBInspectable CGFloat cornerRadius;
//@property (assign, nonatomic) IBInspectable UIEdgeInsets edgeInset;
//@property (strong,nonatomic) IBInspectable NSString* holderFontName;
- (void)setup;

@end
