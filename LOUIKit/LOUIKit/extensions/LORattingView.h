//
//  starsView.h
//  Pamperologist
//
//  Created by ShihKuo-Hsun on 2015/4/7.
//  Copyright (c) 2015年 Pamperologist. All rights reserved.
//

#import "LOView.h"

@interface LORattingView : LOView
@property (strong, nonatomic) IBInspectable UIImage *defaultImage;
@property (strong, nonatomic) IBInspectable UIImage *rattingImage;

@property (assign, nonatomic) IBInspectable NSInteger ratting;
@end
