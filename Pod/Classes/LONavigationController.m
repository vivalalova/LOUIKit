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
    
    
    if ((self && self.navTintColor) ) {
        self.navigationBar.tintColor = self.navTintColor;
    }
    
    if ((self && self.navBarTintColor) ) {
        self.navigationBar.barTintColor = self.navBarTintColor;
    }
    
    if (self && self.navBarColorSameWithTintColor) {
        self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:self.navigationBar.tintColor};
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    if (self.lightStatusBar) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

@end
