//
//  LOLabel.m
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/19.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "LOLabel.h"
#import "LOPrefixHeader.h"

@interface LOLabel ()

@property (strong,nonatomic) UIVisualEffectView *blurredView;
@end


@implementation LOLabel

//-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    self = [super initWithCoder:aDecoder];
//    [self setup];
//    
//    return self;
//}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self setup];
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [self setR];
}

- (void)setR {
    if (self.cornerRadius || self.circle) {
        self.layer.cornerRadius = self.circle ? self.frame.size.height / 2 : self.cornerRadius;
    }
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

- (void)setup {
    [self setR];
    
    if (self.blur == YES) {
        [self addSubview:self.blurredView];
        [self sendSubviewToBack:self.blurredView];
        
        self.backgroundColor = [UIColor clearColor];
    }
    
    self.borderColor = self.borderColor;
    self.borderWidth = self.borderWidth;
}

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = { self.padding.origin.x, self.padding.origin.y, self.padding.size.width, self.padding.size.height };
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
}
-(void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    self.layer.borderWidth = _borderWidth;
}

-(UIVisualEffectView *)blurredView{
    if (!_blurredView) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _blurredView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        _blurredView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        _blurredView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return _blurredView;
}

- (void)setCircle:(BOOL)circle {
    _circle = circle;
    if (_circle == YES) {
        self.layer.cornerRadius = self.frame.size.height / 2;
    }
}

@end
