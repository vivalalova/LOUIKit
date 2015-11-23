//
//  LOButton.m
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "LOButton.h"
#import "LOPrefixHeader.h"

IB_DESIGNABLE

@interface LOButton ()
@property (nonatomic, strong) UIActivityIndicatorView *indicator;
@property (nonatomic, strong) UIImage *tempImage;
@property (nonatomic, strong) NSString *tempTitle;
@property (nonatomic, assign) CGFloat tempBorderWidth;
@property (nonatomic, strong) UIColor *tempBackGroundColor;
@end

@implementation LOButton
@synthesize indicator;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.titleLabel.numberOfLines = 20;
    [self drawRect:self.frame];

    if (self.cornerRadius || self.circle) {
        self.clipsToBounds = YES;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.circle ? self.frame.size.height / 2 : self.cornerRadius;
    }

    self.layer.borderColor = self.borderColor.CGColor;
    self.layer.borderWidth = self.borderWidth;

    self.enabled = self.enabled;
}

- (void)prepareForInterfaceBuilder {
    [self setup];
}

- (void)setLock:(BOOL)lock {
    [self setLock:lock withTitle:self.tempTitle];
}

- (void)setLock:(BOOL)lock withTitle:(NSString *)title {
    dispatch_async(dispatch_get_main_queue(), ^{
        _lock = lock;

        self.tempTitle = title;
        if (_lock) {
            [self.indicator startAnimating];

            self.tempImage = self.imageView.image;
            [self setImage:nil forState:UIControlStateNormal];

            self.tempTitle = self.titleLabel.text;
            [self setTitle:@"" forState:UIControlStateNormal];

            self.tempBorderWidth = self.layer.borderWidth;
            self.layer.borderWidth = 0;

            //            self.tempBackGroundColor = self.backgroundColor;
            //            self.backgroundColor = [UIColor clearColor];

            self.userInteractionEnabled = NO;
        } else {
            [self.indicator stopAnimating];

            [self setImage:self.tempImage forState:UIControlStateNormal];
            self.tempImage = nil;

            [self setTitle:self.tempTitle forState:UIControlStateNormal];
            self.tempTitle = nil;

            self.layer.borderWidth = self.tempBorderWidth;
            self.tempBorderWidth = 0;

            //            self.backgroundColor = self.tempBackGroundColor;
            //            self.tempBackGroundColor = nil;

            self.userInteractionEnabled = YES;
        }
    });
}

-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

- (UIActivityIndicatorView *)indicator {
    if (!indicator) {
        indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        indicator.userInteractionEnabled = NO;
        indicator.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        [indicator startAnimating];
        [self addSubview:indicator];
    }

    if ((self.superview && [self.superview.backgroundColor isEqual:UIColorFromRGB(0xffffff)])  || [self.backgroundColor isEqual:UIColorFromRGB(0xFFFFFF)]) {
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    } else {
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    }

    return indicator;
}

@end
