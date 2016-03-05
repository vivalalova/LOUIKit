//
//  starsView.m
//  Pamperologist
//
//  Created by ShihKuo-Hsun on 2015/4/7.
//  Copyright (c) 2015年 Pamperologist. All rights reserved.
//

#import "LORattingView.h"

@interface LORattingView () {
    UIImageView *imageView1;
    UIImageView *imageView2;
    UIImageView *imageView3;
    UIImageView *imageView4;
    UIImageView *imageView5;
}
@end

@implementation LORattingView

- (void)setup {
    [super setup];
    
    imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 5 * 0, 0, self.bounds.size.width / 5, self.bounds.size.height)];
    imageView1.image = self.defaultImage ? self.defaultImage : nil;
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView1];
    
    imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 5 * 1, 0, self.bounds.size.width / 5, self.bounds.size.height)];
    imageView2.image = self.defaultImage ? self.defaultImage : nil;
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView2];
    
    imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 5 * 2, 0, self.bounds.size.width / 5, self.bounds.size.height)];
    imageView3.image = self.defaultImage ? self.defaultImage : nil;
    imageView3.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView3];
    
    imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 5 * 3, 0, self.bounds.size.width / 5, self.bounds.size.height)];
    imageView4.image = self.defaultImage ? self.defaultImage : nil;
    imageView4.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView4];
    
    imageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 5 * 4, 0, self.bounds.size.width / 5, self.bounds.size.height)];
    imageView5.image = self.defaultImage ? self.defaultImage : nil;
    imageView5.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView5];
    
    self.ratting = self.ratting;
    self.backgroundColor = [UIColor clearColor];
}

- (void)setRatting:(NSInteger)ratting {
    _ratting = ratting;
    
    UIImage *defaultImg = self.defaultImage ? self.defaultImage : nil;
    UIImage *rattingImg = self.rattingImage ? self.rattingImage : [UIImage imageNamed:@"review1"];
    
    imageView1.image = (ratting > 0) ? rattingImg : defaultImg;
    imageView2.image = (ratting > 1) ? rattingImg : defaultImg;
    imageView3.image = (ratting > 2) ? rattingImg : defaultImg;
    imageView4.image = (ratting > 3) ? rattingImg : defaultImg;
    imageView5.image = (ratting > 4) ? rattingImg : defaultImg;
}

@end
