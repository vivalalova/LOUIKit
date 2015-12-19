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
}
@property (nonatomic, strong)  UIVisualEffectView *blurredView;
@end

@implementation LOView
@synthesize blurStyle;

//from code
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
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
    self.blurredView.frame = self.bounds;
    
    [self setShadow];
}

- (void)setup {
    [self setShadow];
    [self.layer insertSublayer:self.gradientLayer
                       atIndex:0];
}

#pragma mark - private

- (void)setShadow {
    //performance
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    
    self.layer.shadowRadius = self.cornerRadius;
//    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = self.shadowOpacity;
    self.layer.shadowOffset = CGSizeMake(self.shadowOffset.x, self.shadowOffset.y);
}

#pragma mark - setter & getter

- (void)setCircle:(BOOL)circle {
    _circle = circle;
    if (_circle == YES) {
        self.layer.cornerRadius = self.frame.size.height / 2;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

- (void)setBlur:(BOOL)blur {
    _blur = blur;
    
    if (self.blur == YES && OSVersion >= 8.0 && self.blurredView == nil) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:self.blurStyle];
        
        self.blurredView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        self.blurredView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        self.blurredView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self addSubview:self.blurredView];
        [self sendSubviewToBack:self.blurredView];
        
        self.backgroundColor = [UIColor clearColor];
        
        self.clipsToBounds = YES;
        self.layer.masksToBounds = YES;
    } else if (self.blur == YES && OSVersion < 8.0) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    } else if (self.blur == NO && self.blurredView.superview) {
        [self.blurredView removeFromSuperview];
        self.blurredView = nil;
    }
}

- (void)setShadowOffset:(CGPoint)shadowOffset {
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

- (void)setGradientColors:(NSArray <UIColor *> *)gradientColors {
    if (!_gradientColors) {
        _gradientColors = [[NSArray alloc] init];
    }
    
    _gradientColors = gradientColors;
    
    NSMutableArray *cgColors = [[NSMutableArray alloc] init];
    [_gradientColors enumerateObjectsUsingBlock:^(UIColor *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        [cgColors addObject:(id)obj.CGColor];
    }];
    
    self.gradientLayer.colors = cgColors;
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

- (void)setBlurStyle:(NSInteger)newBlurStyle {
    blurStyle = newBlurStyle;
    
    if (self.blurredView) {
        //remove and new
        self.blur = NO;
        self.blur = YES;
    }
}

- (NSInteger)blurStyle {
    switch (blurStyle) {
        case UIBlurEffectStyleExtraLight:
        case UIBlurEffectStyleLight:
        case UIBlurEffectStyleDark:
            break;
            
        default:
            blurStyle = 2;
            break;
    }
    return blurStyle;
}

@end
