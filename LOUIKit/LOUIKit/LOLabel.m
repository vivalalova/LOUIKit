//
//  LOLabel.m
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/19.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "LOLabel.h"
#import "LOPrefixHeader.h"

IB_DESIGNABLE
@interface LOLabel ()

@end
@implementation LOLabel {
}

//from code
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self setup];
    }
    return self;
}

- (void)prepareForInterfaceBuilder {
    [self setup];
}

- (void)setup {
    if (self.cornerRadius) {
        self.clipsToBounds = YES;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.cornerRadius;
    }

    if (self.blur && OSVersion >= 8.0) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *blurredView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurredView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        blurredView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:blurredView];
        [self sendSubviewToBack:blurredView];

        self.backgroundColor = [UIColor clearColor];
    } else if (self.blur && OSVersion < 8.0) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    }
}

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = { self.padding.origin.x, self.padding.origin.y, self.padding.size.width, self.padding.size.height };
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}





@end
