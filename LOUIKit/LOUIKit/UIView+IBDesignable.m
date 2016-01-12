//
//  UIView+IBDesignable.m
//  LOUIKit
//
//  Created by Kuo-HsunShih on 2016/1/7.
//  Copyright © 2016年 LO. All rights reserved.
//

#import "UIView+IBDesignable.h"
#import "Masonry.h"

@implementation UIView (IBDesignable)
@dynamic blurStyle;
@dynamic roundForm;

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    self.cornerRadius = self.cornerRadius;

    
    for (CALayer* layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            layer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            return;
        }
    }
}

#pragma mark - getter & setters

- (BOOL)masksToBounds {
    return self.layer.masksToBounds;
}

- (void)setMasksToBounds:(BOOL)masksToBounds {
    self.layer.masksToBounds = masksToBounds;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

///
- (void)setRoundForm:(BOOL)roundForm {
    if (roundForm) {
        self.cornerRadius = self.frame.size.height / 2;
    }
}

#pragma mark - Shadow

- (UIColor *)shadowColor {
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

- (void)setShadowColor:(UIColor *)shadowColor {
    self.layer.shadowColor = shadowColor.CGColor;
}

- (CGFloat)shadowOpacity {
    return self.layer.shadowOpacity;
}

- (void)setShadowOpacity:(CGFloat)shadowOpacity {
    self.layer.shadowOpacity = shadowOpacity;
}

- (CGFloat)shadowRadius {
    return self.layer.shadowRadius;
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    self.layer.shadowRadius = shadowRadius;
}

- (CGSize)shadowOffset {
    return self.layer.shadowOffset;
}

- (void)setShadowOffset:(CGSize)shadowOffset {
    self.layer.shadowOffset = shadowOffset;
}

#pragma mark - Blur

- (void)setBlurStyle:(int)BlurStyle {
    if (BlurStyle < 0 || BlurStyle > 2) {
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[UIVisualEffectView class]]) {
                [view removeFromSuperview];
                return;
            }
        }
    }
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:BlurStyle];
    UIVisualEffectView *blurredView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurredView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    blurredView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self addSubview:blurredView];
    [self sendSubviewToBack:blurredView];
}

#pragma mark - GradientLayer



- (void)setGradientColors:(NSArray <UIColor *> *)gradientColors {
    NSMutableArray *cgColors = [[NSMutableArray alloc] init];
    for (UIColor* color in gradientColors) {
        [cgColors addObject:(id)color.CGColor];
    }
    
    CAGradientLayer* gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.colors = cgColors;
    
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    
    gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}



@end
