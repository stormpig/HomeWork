//
//  ViewController.m
//  HandWorker_Find
//
//  Created by 曾凯 on 15-7-20.
//  Copyright (c) 2015年 dream. All rights reserved.
//

#import "ViewController.h"
#import "ZKEliteContentView.h"
//#import "ZKEliteController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    ZKEliteController *eliteController = [ZKEliteController eliteController];
//    [self.view addSubview:eliteController.view];
    ZKEliteContentView *eliteView = [ZKEliteContentView viewWithModels:nil];
    [self.view addSubview:eliteView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
