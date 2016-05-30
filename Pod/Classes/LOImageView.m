//
//  LOImageView.m
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "LOImageView.h"
#import "LOPrefixHeader.h"

@interface LOImageView ()

@end
@implementation LOImageView

- (instancetype)init {
    self = [super init];
    
    return self;
}

//from storyboard
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    [self setR];
    
    self.layer.borderColor = self.borderColor.CGColor;
    self.layer.borderWidth = self.borderWidth;
}

- (void)prepareForInterfaceBuilder {
    [self setup];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self setR];
}

- (void)setR {
    if (self.cornerRadius || self.circle) {
        self.layer.cornerRadius = self.circle ? self.frame.size.height / 2 : self.cornerRadius;
    }
}

- (void)setCircle:(BOOL)circle {
    _circle = circle;
    if (_circle == YES) {
        self.layer.cornerRadius = self.frame.size.height / 2;
    }
}

- (void)setImage:(UIImage *)image {
    [super setImage:[image imageWithRenderingMode:(self.renderingTemplate ? UIImageRenderingModeAlwaysTemplate : UIImageRenderingModeAutomatic)]];
}

- (void)setRenderingTemplate:(BOOL)renderingTemplate {
    _renderingTemplate = renderingTemplate;
    self.image = [self.image imageWithRenderingMode:(self.renderingTemplate ? UIImageRenderingModeAlwaysTemplate : UIImageRenderingModeAutomatic)];
}

@end
