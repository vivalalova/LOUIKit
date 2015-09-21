//
//  LOView.m
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "LOView.h"
#import "LOPrefixHeader.h"

@interface LOView () {
    UIVisualEffectView *blurredView;
}

@end

@implementation LOView

//from code
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    return self;
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
    blurredView.frame = self.bounds;
}

- (void)setup {
    [self setShadow];
    [self.layer insertSublayer:self.gradientLayer
                       atIndex:0];
}

#pragma mark - private

- (void)setShadow {
    if (self.shadowRadius && self.shadowOpacity) {
        //performance
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
        
        self.clipsToBounds = NO;
        self.layer.masksToBounds = NO;
        self.layer.shadowRadius = self.shadowRadius;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = self.shadowOpacity;
        self.layer.shadowOffset = self.shadowOffset;
    }
}

- (void)setForCircleAndCornerRadius {
    if (self.cornerRadius || self.circle) {
        self.clipsToBounds = YES;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.circle ? self.frame.size.height / 2 : self.cornerRadius;
    }
}

#pragma mark - setter & getter

- (void)setCircle:(BOOL)circle {
    _circle = circle;
    [self setForCircleAndCornerRadius];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
}

- (void)setBlur:(BOOL)blur {
    _blur = blur;
    
    if (self.blur == YES && OSVersion >= 8.0 && blurredView == nil) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        
        blurredView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurredView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        blurredView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:blurredView];
        [self sendSubviewToBack:blurredView];
        
        self.backgroundColor = [UIColor clearColor];
        
        self.clipsToBounds = YES;
        self.layer.masksToBounds = YES;
    } else if (self.blur == YES && OSVersion < 8.0) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    } else if (self.blur == NO && blurredView.superview) {
        [blurredView removeFromSuperview];
        blurredView = nil;
    }
}

- (void)setShadowOffset:(CGSize)shadowOffset {
    _shadowOffset = shadowOffset;
    [self setShadow];
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    _shadowRadius = shadowRadius;
    [self setShadow];
}

- (void)setShadowOpacity:(CGFloat)shadowOpacity {
    _shadowOpacity = shadowOpacity;
    [self setShadow];
}

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [[CAGradientLayer alloc] init];
    }
    //漸層方向
    _gradientLayer.startPoint = CGPointMake(0, 0);
    _gradientLayer.endPoint = CGPointMake(0, 1);
    
    _gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    return _gradientLayer;
}

@end
