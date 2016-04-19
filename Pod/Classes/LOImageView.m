//
//  LOImageView.m
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "LOImageView.h"
#import "LOPrefixHeader.h"

@interface LOImageView ()


@end
@implementation LOImageView

-(instancetype)init{
    self = [super init];
    
    
    return self;
}

//from storyboard
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    if (self.circle == YES) {
        self.layer.cornerRadius = self.bounds.size.height/2;
    }else if (self.cornerRadius) {
        self.layer.cornerRadius = self.cornerRadius;
    }
    
    self.layer.borderColor = self.borderColor.CGColor;
    self.layer.borderWidth = self.borderWidth;
}

- (void)prepareForInterfaceBuilder {
    [self setup];
}

@end
