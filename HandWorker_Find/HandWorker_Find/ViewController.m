//
//  ViewController.m
//  HandWorker_Find
//
//  Created by 曾凯 on 15-7-20.
//  Copyright (c) 2015年 dream. All rights reserved.
//

#import "ViewController.h"
#import "ZKSlideCell.h"
#import "ZKSlide.h"
#import "ZKNav.h"
#import "ZKAdv.h"
#import "AFHTTPRequestOperationManager.h"
#import "ZKClass.h"
#import "ZKClassCell.h"
#import "ZKSectionHeader.h"
#import "ZKProduct.h"
#import "ZKProductCell.h"
#import "ZKDaren.h"
#import "ZKDarenCell.h"
#import "ZKTopic.h"
#import "ZKTopicCell.h"
#import "ZKCourse.h"
#import "ZKCourseCell.h"
#import "ZKEliteContentView.h"

// 下拉刷新
#import "MJRefresh.h"

#define URL1 @"http://m.shougongke.com/index.php?&c=index&a=indexnew&vid=9&"

@interface ViewController ()

@property (strong, nonatomic) ZKEliteContentView *eliteView;

@property (strong, nonatomic) NSDictionary *data;
@property (strong, nonatomic) NSArray *slides;
@property (strong, nonatomic) NSArray *navs;
@property (strong, nonatomic) NSArray *advs;
@property (strong, nonatomic) NSArray *classNes;
@property (strong, nonatomic) NSArray *sectionTitle;
@property (strong, nonatomic) NSArray *products;
@property (strong, nonatomic) ZKDaren *daren;
@property (strong, nonatomic) NSArray *topices;
@property (strong, nonatomic) NSArray *courses;
@property (strong, nonatomic) NSArray *models;

@end

@implementation ViewController

#pragma mark - Getter 


- (NSArray *)sectionTitle
{
    return @[@"头视图",@"互动课堂", @"限时抢购", @"达人推荐", @"手工专题", @"热门教程",@"其他"];
}

#pragma mark - 请求网络数据

- (void)requestData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URL1 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [dict writeToFile:@"/Users/ms/Desktop/ZKEliteController.plist" atomically:YES];
        self.data = dict[@"data"];
        
        NSMutableArray *temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"slide"]) {
            ZKSlide *slide = [ZKSlide baseWithDict:dict];
            [temp addObject:slide];
        }
        self.slides = temp;
        
        temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"nav"]) {
            ZKNav *slide = [ZKNav baseWithDict:dict];
            [temp addObject:slide];
        }
        self.navs = temp;
        
        temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"adv"]) {
            ZKAdv *adv = [ZKAdv baseWithDict:dict];
            [temp addObject:adv];
        }
        self.advs = temp;
        
        temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"classs"]) {
            ZKClass *classN = [ZKClass baseWithDict:dict];
            [temp addObject:classN];
        }
        self.classNes = temp;
        
        temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"products"]) {
            ZKClass *product = [ZKClass baseWithDict:dict];
            [temp addObject:product];
        }
        self.products = temp;
        
        self.daren = [ZKDaren baseWithDict:self.data[@"daren"]];
        
        temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"topic"]) {
            ZKTopic *topic = [ZKTopic baseWithDict:dict];
            [temp addObject:topic];
        }
        self.topices = temp;
        
        temp = [NSMutableArray new];
        for (NSDictionary *dict in self.data[@"course"]) {
            ZKCourse *course = [ZKCourse baseWithDict:dict];
            [temp addObject:course];
        }
        self.courses = temp;
        self.models = @[self.slides ,self.navs, self.advs, self.classNes, self.products, self.topices, self.courses];
        self.eliteView.models = self.models;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"网络请求失败");
     }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.eliteView = [ZKEliteContentView viewWithModels:nil];
    [self.view addSubview:self.eliteView];
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
