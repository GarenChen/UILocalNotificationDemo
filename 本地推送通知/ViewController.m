//
//  ViewController.m
//  本地推送通知
//
//  Created by 陈广川 on 16/1/22.
//  Copyright © 2016年 陈广川. All rights reserved.
//

#import "ViewController.h"
#import "GCLocalNotification.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)sendLocalNotification:(id)sender {
    [GCLocalNotification fireLocalNote];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
