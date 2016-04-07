//
//  LOPullRefreshCollectionView.h
//  Pamperologist
//
//  Created by ShihKuo-Hsun on 2015/4/23.
//  Copyright (c) 2015年 Pamperologist. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LOCollectionViewDelegate;

IB_DESIGNABLE
@interface LOCollectionView : UICollectionView

//layers
@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;

@property (weak, nonatomic) id <LOCollectionViewDelegate> delegate;
@property (assign, nonatomic) IBInspectable BOOL pullRefreshAllowed;

@property (assign, nonatomic) IBInspectable BOOL pushUpRefreshAllowed;

- (void)endRefreshingAnimation;
- (void)endBottomRefreshing;
- (NSIndexPath *)indexPathWithView:(UIView *)view;
@end

@protocol LOCollectionViewDelegate <UITableViewDelegate>

@optional
- (void)LOCollectionViewDidStartRefreshAnimation:(LOCollectionView *)collectionView;
- (void)LOCollectionViewDidStartBottomRefresh:(LOCollectionView *)collectionView;

@end