//
//  LONavigationController.h
//  Pods
//
//  Created by Kuo-HsunShih on 2016/8/1.
//
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface LONavigationController : UINavigationController
/**
 *  Set UIViewControllerBasedStatusBarAppearance to YES in info.plist
 */
@property (assign,nonatomic) IBInspectable BOOL lightStatusBar;

@end
