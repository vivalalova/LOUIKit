//
//  LOTableView.h
//  Pamperologist
//
//  Created by ShihKuo-Hsun on 2015/4/24.
//  Copyright (c) 2015年 Pamperologist. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LOTableViewDelegate;

IB_DESIGNABLE
@interface LOTableView : UITableView

@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;

@property (weak, nonatomic) id <LOTableViewDelegate, UITableViewDelegate> delegate;

@property (assign, nonatomic) IBInspectable BOOL pullRefreshAllowed;
@property (assign, nonatomic) IBInspectable BOOL pushUpRefreshAllowed;

@property (assign, nonatomic) BOOL refreshing;
- (NSIndexPath *)indexpathOfCellWithView:(UIView *)sender;
- (void)endRefreshingAnimation;
- (void)endBottomRefreshing;

@end

@protocol LOTableViewDelegate <UITableViewDelegate>

@optional
- (void)LOTableViewDidStartRefreshAnimation:(LOTableView *)tableView;
- (void)LOTableViewDidStartBottomRefresh:(LOTableView *)tableView;

@end