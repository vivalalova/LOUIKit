//
//  TableViewController.m
//  LOUIKit
//
//  Created by Kuo-HsunShih on 2016/3/24.
//  Copyright © 2016年 vivalalova. All rights reserved.
//

#import "TableViewController.h"
@interface TableViewController ()<UITableViewDataSource,LOTableViewDelegate>

@end

@implementation TableViewController

#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"did select at index %d",indexPath.row);
}

-(void)LOTableViewDidStartRefreshAnimation:(LOTableView *)tableView{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"end refresh in 1 second");
        [tableView endRefreshingAnimation];
    });
}

-(void)LOTableViewDidStartBottomRefresh:(LOTableView *)tableView{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"call [tableView endBottomRefreshing] if needed");
        [tableView endBottomRefreshing];
    });
    
}

@end
