//
//  superViewController.m
//  Pamperologist
//
//  Created by ShihKuo-Hsun on 2015/4/7.
//  Copyright (c) 2015年 Pamperologist. All rights reserved.
//

#import "LOViewController.h"



@implementation LOViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.tableview.rowHeight = UITableViewAutomaticDimension;
    self.tableview.estimatedRowHeight = 100;
    self.tableview.tableFooterView = [[UIView alloc] init];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AFNetworkReachabilityStatusReachableON) name:@"AFNetworkReachabilityStatusReachableON" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AFNetworkReachabilityStatusReachableOFF) name:@"AFNetworkReachabilityStatusReachableOFF" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AFNetworkReachabilityStatusReachableON" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AFNetworkReachabilityStatusReachableOFF" object:nil];

//    [SVProgressHUD dismiss];
}

#pragma mark - reachability
//for inherit
- (void)AFNetworkReachabilityStatusReachableON {
}

//for inherit
- (void)AFNetworkReachabilityStatusReachableOFF {
}

- (void)keyboardChangeFrame:(NSNotification *)notification {
    [self keyboardWillChangeToFrame:[notification.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue]
                           duration:[notification.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] floatValue]];
}

//for inherit
- (void)keyboardWillChangeToFrame:(CGRect)frame duration:(CGFloat)duration {
}


#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}


#pragma mark - getter

-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    
    return _dataSource;
}


@end
