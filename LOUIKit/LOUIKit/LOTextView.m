//
//  LOTextView.m
//  Pamperologist
//
//  Created by ShihKuo-Hsun on 2015/4/2.
//  Copyright (c) 2015年 Pamperologist. All rights reserved.
//

#import "LOTextView.h"
#import "LOPrefixHeader.h"

@interface LOTextView ()

@end

@implementation LOTextView {
    IBInspectable CGRect padding;
}

//@synthesize placeHolderLabel;

//from code
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    return self;
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

//from storyboard?
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    
    self.contentInset = UIEdgeInsetsMake(padding.origin.x, padding.origin.y, padding.size.width, padding.size.height);
}


@end
