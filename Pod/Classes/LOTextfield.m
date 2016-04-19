//
//  LOTextfield.m
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "LOTextfield.h"
#import "LOPrefixHeader.h"

IB_DESIGNABLE

@interface LOTextfield () {
    IBInspectable CGRect padding;
    IBInspectable UIColor *placeHolderColor;
}

@property (assign, nonatomic)    IBInspectable CGFloat cornerRadius;

@end
@implementation LOTextfield

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
//        self.clipsToBounds = YES;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.cornerRadius;
    }
    //padding
    UIView *paddingView = [[UIView alloc] initWithFrame:padding];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
    
    //place holder color
    if (placeHolderColor) {
        [self setValue:placeHolderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    
    //border
    if (self.borderWidth) {
        self.layer.borderWidth = self.borderWidth;
        self.layer.borderColor = self.borderColor.CGColor;
    }
}

- (void)prepareForInterfaceBuilder {
    [self setup];
}

@end
