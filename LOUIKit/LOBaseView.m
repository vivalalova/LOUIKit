//
//  LOBaseView.m
//  LOUIKit
//
//  Created by Kuo-HsunShih on 2016/1/7.
//  Copyright © 2016年 LO. All rights reserved.
//

#import "LOBaseView.h"

@implementation LOBaseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(DesignableBlock)block{
    return ^{
        NSLog(@"hi");
    };
}

-(DesignableBlock)block{
    return ^{
      
    };
}

@end
