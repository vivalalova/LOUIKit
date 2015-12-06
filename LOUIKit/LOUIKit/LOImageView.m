//
//  LOImageView.m
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "LOImageView.h"
#import "LOPrefixHeader.h"

IB_DESIGNABLE
@interface LOImageView ()

@end
@implementation LOImageView

//from code
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    return self;
}

//from storyboard
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    if (self.cornerRadius) {
        self.clipsToBounds = YES;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.cornerRadius;
    }
    
    self.layer.borderColor = self.borderColor.CGColor;
    self.layer.borderWidth = self.borderWidth;
}

- (void)prepareForInterfaceBuilder {
    [self setup];
}

@end
