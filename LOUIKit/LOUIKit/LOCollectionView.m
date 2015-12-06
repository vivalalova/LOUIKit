//
//  LOPullRefreshCollectionView.m
//  Pamperologist
//
//  Created by ShihKuo-Hsun on 2015/4/23.
//  Copyright (c) 2015年 Pamperologist. All rights reserved.
//

#import "LOCollectionView.h"
#import "LOPrefixHeader.h"

@interface LOCollectionView () {
    UIRefreshControl *refreshControl;
    BOOL lastStatusOfRefreshControl;
    
    //    UIRefreshControl *bottomRefreshControl;
    BOOL bottomRefreshing;
    BOOL lastStatusOfBottomRefreshControl;
}
@property (assign, nonatomic) BOOL refreshing;

@end

@implementation LOCollectionView
//@dynamic delegate;
#define kContentOffset @"contentOffset"

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setUp];
        
        //下拉刷新 觸發delegate
        [self addObserver:self forKeyPath:kContentOffset options:NSKeyValueObservingOptionOld context:nil];

    }
    
    return self;
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setUp];
}


- (void)setUp {
    /*cornerRadus & border*/ {
        if (self.cornerRadius) {
            self.clipsToBounds = YES;
            self.layer.masksToBounds = YES;
            self.layer.cornerRadius = self.cornerRadius;
        }
        
        self.layer.borderColor = self.borderColor.CGColor;
        self.layer.borderWidth = self.borderWidth;
    }
    
    /*pull and push refreshing*/ {
        if (!refreshControl && self.pullRefreshAllowed == YES) {
            refreshControl = [[UIRefreshControl alloc] init];
            [self addSubview:refreshControl];
        }
        
    }
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:kContentOffset];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:kContentOffset]) {
        //因為下拉時他自己會轉，所以不用叫他轉/*下拉刷新*/
        if (self.pullRefreshAllowed == YES) {
            if (lastStatusOfRefreshControl == NO && refreshControl.isRefreshing == YES) {                                                                   // 表示剛開始
                if ([self.delegate respondsToSelector:@selector(LOCollectionViewDidStartRefreshAnimation:)]) {
                    [self.delegate LOCollectionViewDidStartRefreshAnimation:self];
                }
            }
            lastStatusOfRefreshControl = refreshControl.isRefreshing;
        } else {
            //			NSLog(@"enable 'pullRefreshAllowed' to allow pull refreshing");
        }
        
        //未有動畫/*上拉刷新*/
        if (self.pushUpRefreshAllowed == YES) {
            if (bottomRefreshing == NO && self.contentOffset.y > self.contentSize.height - 400) {
                bottomRefreshing = YES;
            }
            
            if (lastStatusOfBottomRefreshControl == NO && bottomRefreshing == YES && self.pushUpRefreshAllowed == YES) {
                if ([self.delegate respondsToSelector:@selector(LOCollectionViewDidStartBottomRefresh:)]) {
                    [self.delegate LOCollectionViewDidStartBottomRefresh:self];
                }
            }
            lastStatusOfBottomRefreshControl = bottomRefreshing;
        } else {
            //			NSLog(@"enable 'pushUpRefreshAllowed' to allow pull refreshing");
        }
    }
}

- (void)setPullRefreshAllowed:(BOOL)pullRefreshAllowed {
    _pullRefreshAllowed = pullRefreshAllowed;
    if (pullRefreshAllowed == NO && refreshControl) {
        [refreshControl removeFromSuperview];
        refreshControl = nil;
    } else if (!refreshControl) {
        refreshControl = [[UIRefreshControl alloc] init];
        [self addSubview:refreshControl];
    }
}

- (void)setRefreshing:(BOOL)refreshing {
    _refreshing = refreshing;
    
    if (_refreshing) {
        [refreshControl beginRefreshing];
        lastStatusOfRefreshControl = YES;
    } else {
        [refreshControl endRefreshing];
        lastStatusOfRefreshControl = NO;
    }
}

- (void)endRefreshingAnimation {
    self.refreshing = NO;
}

- (void)endBottomRefreshing {
    bottomRefreshing = NO;
}

- (NSIndexPath *)indexPathWithView:(UIView *)view {
    NSIndexPath *indexPath;
    
    while (view.superview) {
        if ([view.superview isKindOfClass:[UICollectionViewCell class]]) {
            UICollectionViewCell *cell = (UICollectionViewCell *)view.superview;
            indexPath = [self indexPathForCell:cell];
            break;
        } else {
            view = view.superview;
        }
    }
    
    return indexPath;
}

@end
