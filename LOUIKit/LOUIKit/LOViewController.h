//
//  superViewController.h
//  Pamperologist
//
//  Created by ShihKuo-Hsun on 2015/4/7.
//  Copyright (c) 2015年 Pamperologist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LOViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) NSMutableArray* dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableview;


- (void)keyboardWillChangeToFrame:(CGRect)frame duration:(CGFloat)duration;

- (void)AFNetworkReachabilityStatusReachableON;
- (void)AFNetworkReachabilityStatusReachableOFF;
@end
