//
//  ViewController.m
//  LOUIKit
//
//  Created by ShihKuo-Hsun on 2015/5/6.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "ViewController.h"
#import "LOUIKit.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet LOView *gratView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.gratView.gradientLayer.colors =  @[
                                            [UIColor colorWithRed:0.99 green:0.82 blue:0.08 alpha:1],
                                            [UIColor colorWithRed:0.56 green:0.08 blue:1 alpha:1]
                                            ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
