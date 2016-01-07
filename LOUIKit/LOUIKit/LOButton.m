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



- (void)prepareForInterfaceBuilder {
    [self setup];
}

- (void)setup {
    
}

- (void)setLock:(BOOL)lock {
    UIColor *color;
    if ((self.superview && [self.superview.backgroundColor isEqual:UIColorFromRGB(0xffffff)])  || [self.backgroundColor isEqual:UIColorFromRGB(0xFFFFFF)]) {
        color = [UIColor lightGrayColor];
    } else {
        color = [UIColor whiteColor];
    }
    
    [self setLock:lock withTitle:self.tempTitle color:color];
}

- (void)setLock:(BOOL)lock withTitle:(NSString *)title color:(UIColor *)color {
    dispatch_async(dispatch_get_main_queue(), ^{
        _lock = lock;
        
        self.tempTitle = title;
        if (_lock) {
            [self.indicator startAnimating];
            
            self.tempImage = self.imageView.image;
            [self setImage:nil forState:UIControlStateNormal];
            
            self.tempTitle = self.titleLabel.text;
            [self setTitle:@"" forState:UIControlStateNormal];
            
            indicator.color = color;
            
            self.userInteractionEnabled = NO;
        } else {
            [self.indicator stopAnimating];
            
            [self setImage:self.tempImage forState:UIControlStateNormal];
            self.tempImage = nil;
            
            [self setTitle:self.tempTitle forState:UIControlStateNormal];
            self.tempTitle = nil;
            
            indicator.color = color;
            
            self.userInteractionEnabled = YES;
        }
    });
}

- (UIActivityIndicatorView *)indicator {
    if (!indicator) {
        indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        indicator = [[UIActivityIndicatorView alloc] init];
        indicator.userInteractionEnabled = NO;
        indicator.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        //        [indicator startAnimating];
        [self addSubview:indicator];
    }
    
    return indicator;
}

@end
