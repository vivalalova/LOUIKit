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
    
    self.gratView.gradientColors = @[
                                     [UIColor colorWithRed:0.99 green:0.82 blue:0.08 alpha:1],
                                     [UIColor colorWithRed:0.56 green:0.08 blue:1 alpha:1]
                                     ];
}

- (IBAction)btnPressed:(LOButton *)sender {
    sender.lock = !sender.lock;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        sender.lock = !sender.lock;
    });
}

@end
