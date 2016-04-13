//
//  ExampleTableViewViewController.m
//  example
//
//  Created by Kuo-HsunShih on 2016/4/10.
//  Copyright © 2016年 Lova. All rights reserved.
//

#import "ExampleTableViewViewController.h"
#import <LOUIKit/LOUIKit.h>
@interface ExampleTableViewViewController ()<LOTableViewDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation ExampleTableViewViewController

#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text =[NSString stringWithFormat:@"%d",(int)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"forRowAtIndex: %d",(int)indexPath.row);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"did select row : %d",(int)indexPath.row);
}

-(void)LOTableViewDidStartRefreshAnimation:(LOTableView *)tableView{
    NSLog(@"start RefreshingAnimation");

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"endRefreshingAnimation");
        [tableView endRefreshingAnimation];
    });
}

-(void)LOTableViewDidStartBottomRefresh:(LOTableView *)tableView{
    NSLog(@"start BottomRefreshing");

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"endBottomRefreshing");
        [tableView endBottomRefreshing];
    });
}

@end
