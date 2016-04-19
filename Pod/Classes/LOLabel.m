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


//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    
//    if (self) {
//        [self setup];
//    }
//    return self;
//}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

- (void)setup {
    if (self.circle == YES) {
        self.layer.cornerRadius = self.bounds.size.height/2;
    }else if (self.cornerRadius) {
        self.layer.cornerRadius = self.cornerRadius;
    }
    
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

@end
