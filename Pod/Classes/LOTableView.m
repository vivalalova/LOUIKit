//
//  LOTableView.m
//  Pamperologist
//
//  Created by ShihKuo-Hsun on 2015/4/24.
//  Copyright (c) 2015年 Pamperologist. All rights reserved.
//

#import "LOTableView.h"
#import "LOPrefixHeader.h"

#define kContentOffset @"contentOffset"

@interface LOTableView () {
    UIRefreshControl *refreshControl;
    BOOL lastStatusOfRefreshControl;
    
    //    UIRefreshControl *bottomRefreshControl;
    BOOL bottomRefreshing;
    BOOL lastStatusOfBottomRefreshControl;
}

@end

@implementation LOTableView
@synthesize refreshing;
@synthesize delegate;
//@dynamic delegate;


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setUp];
        
        //下拉刷新 觸發delegate
        [self addObserver:self forKeyPath:kContentOffset options:NSKeyValueObservingOptionOld context:nil];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setUp];
}

- (void)setUp {
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.cornerRadius;
    self.layer.borderColor = self.borderColor.CGColor;
    self.layer.borderWidth = self.borderWidth;
    
    /*pull and push refreshing*/
    if (!refreshControl && self.pullRefreshAllowed == YES) {
        refreshControl = [[UIRefreshControl alloc] init];
        [self addSubview:refreshControl];
    }
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:kContentOffset]) {
        //因為下拉時他自己會轉，所以不用叫他轉/*下拉刷新*/
        if (self.pullRefreshAllowed == YES) {
            if (self.contentOffset.y < -100) {
                [refreshControl beginRefreshing];
            }
            
            if (lastStatusOfRefreshControl == NO && refreshControl.isRefreshing == YES) {// 表示剛開始
                self.refreshing = YES;
                if ([self.delegate respondsToSelector:@selector(LOTableViewDidStartRefreshAnimation:)]) {
                    [self.delegate LOTableViewDidStartRefreshAnimation:self];
                }
            }
            lastStatusOfRefreshControl = refreshControl.isRefreshing;
        } else {
            //            NSLog(@"enable 'pullRefreshAllowed' to allow pull refreshing");
        }
        
        //未有動畫/*上拉刷新*/
        if (self.pushUpRefreshAllowed == YES) {
            if (bottomRefreshing == NO && (self.contentSize.height - self.contentOffset.y) < 500) {
                bottomRefreshing = YES;
                
                if (lastStatusOfBottomRefreshControl == NO) {
                    if ([self.delegate respondsToSelector:@selector(LOTableViewDidStartBottomRefresh:)]) {
                        [self.delegate LOTableViewDidStartBottomRefresh:self];
                    }
                }
            }
            
            lastStatusOfBottomRefreshControl = bottomRefreshing;
        } else {
            //            NSLog(@"enable 'pushUpRefreshAllowed' to allow pull refreshing");
        }
    }
}

#pragma mark - public

- (NSIndexPath *)indexpathOfCellWithView:(UIView *)sender {
    CGPoint center = [sender convertPoint:sender.center toView:self];
    center.x = self.bounds.size.width / 2;
    
    NSIndexPath *indexpath = [self indexPathForRowAtPoint:center];
    
    return indexpath;
}

- (void)endRefreshingAnimation {
    self.refreshing = NO;
}

- (void)endBottomRefreshing {
    bottomRefreshing = NO;
}

#pragma mark - setter

- (void)setPullRefreshAllowed:(BOOL)pullRefreshAllowed {
    _pullRefreshAllowed = pullRefreshAllowed;
    if (!pullRefreshAllowed && refreshControl) {
        [refreshControl removeFromSuperview];
        refreshControl = nil;
    } else if (!refreshControl) {
        refreshControl = [[UIRefreshControl alloc] init];
        [self addSubview:refreshControl];
    }
}

- (void)setRefreshing:(BOOL)newRefreshing {
    NSLog(@"set %d",newRefreshing);
    NSLog(@"set %d",refreshing);
    
    if (refreshing != newRefreshing) {
        if (refreshing) {
            [refreshControl endRefreshing];
            lastStatusOfRefreshControl = NO;
        } else {
            [refreshControl beginRefreshing];
            lastStatusOfRefreshControl = YES;
        }
        
        refreshing = newRefreshing;
    }
}
@end
