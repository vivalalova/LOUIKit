//
//  LONavigationController.m
//  Pods
//
//  Created by Kuo-HsunShih on 2016/8/1.
//
//

#import "LONavigationController.h"

@implementation LONavigationController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    if (self.lightStatusBar) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

@end
