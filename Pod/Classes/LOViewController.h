//
//  superViewController.h
//  Pamperologist
//
//  Created by ShihKuo-Hsun on 2015/4/7.
//  Copyright (c) 2015年 Pamperologist. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface LOViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong,nonatomic) IBInspectable UIColor* navTintColor;
@property (strong,nonatomic) IBInspectable UIColor* navBarTintColor;
@property (assign,nonatomic) IBInspectable BOOL navBarColorSameWithTintColor;

/**
 *  Set UIViewControllerBasedStatusBarAppearance to YES in info.plist
 */
@property (assign,nonatomic) IBInspectable BOOL lightStatusBar;

@property (strong, nonatomic) NSMutableArray *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

- (void)keyboardWillChangeToFrame:(CGRect)frame duration:(CGFloat)duration;

@end
