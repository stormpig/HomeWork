//
//  ZKEliteContentView.m
//  HandWorker_Find
//
//  Created by 曾凯 on 15-7-20.
//  Copyright (c) 2015年 dream. All rights reserved.
//

#import "ZKEliteContentView.h"

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

// 下拉刷新
#import "MJRefresh.h"

#define URL1 @"http://m.shougongke.com/index.php?&c=index&a=indexnew&vid=9&"


@interface ZKEliteContentView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

//@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) UICollectionView *collectionView;

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

@end

@implementation ZKEliteContentView

#pragma mark - 初始化方法

- (void)setModels:(NSArray *)models
{
    self.slides = models[0];
    self.navs = models[1];
    self.advs = models[2];
    self.classNes = models[3];
    self.products = models[4];
    self.topices = models[5];
    self.courses = models[6];
    [self.collectionView reloadData];
}

+ (id)viewWithModels:(NSArray *)models
{
    return [[self alloc] initWithModels:models];
}

- (id)initWithModels:(NSArray *)models
{
    self = [super initWithFrame:CGRectMake(0, 0, 375, 667)];
    if (self) {
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        
    }
    return self;
}

#pragma mark - Getter

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 5,5);
        UICollectionView *view = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) collectionViewLayout:layout];
        view.backgroundColor = [UIColor colorWithRed:255.0 / 255 green:245.0 / 255 blue:241.0 / 255 alpha:1];
        [self addSubview:view];
        _collectionView = view;
    }
    return _collectionView;
}

- (NSArray *)sectionTitle
{
    return @[@"头视图",@"互动课堂", @"限时抢购", @"达人推荐", @"手工专题", @"热门教程",@"其他"];
}

#pragma mark 协议方法UICollectionViewDataSource

// section 的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
}

// item 的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return self.classNes.count;
    } else if (section == 2) {
        return 1;
    } else if (section == 3) {
        return 1;
    } else if (section == 4) {
        return 2;
    } else if (section == 5) {
        return self.courses.count;
    }
    return 1;
}

// 返回定制 cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ZKSlideCell *cell = [ZKSlideCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.slides = self.slides;
        cell.navs = self.navs;
        cell.advs = self.advs;
        return cell;
    } else if (indexPath.section == 1) {
        ZKClassCell *cell = [ZKClassCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.classN= self.classNes[indexPath.item];
        return cell;
    } else if (indexPath.section == 2) {
        ZKProductCell *cell = [ZKProductCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.product = self.products[3];
        return cell;
    } else if (indexPath.section == 3) {
        ZKDarenCell *cell = [ZKDarenCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.daren = self.daren;
        return cell;
    } else if (indexPath.section == 4) {
        ZKTopicCell *cell = [ZKTopicCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.topic = self.topices[indexPath.item];
        return cell;
    } else if (indexPath.section == 5) {
        ZKCourseCell *cell = [ZKCourseCell cellWithCollectionView:collectionView indexPath:indexPath];
        cell.course = self.courses[indexPath.item];
        return cell;
        
    }
    return nil;
}

// 定制 sectionHeader
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section != 0 && [kind isEqualToString:UICollectionElementKindSectionHeader]) {
        ZKSectionHeader *header = [ZKSectionHeader cellWithCollectionView:collectionView indexPath:indexPath];
        header.title = self.sectionTitle[indexPath.section];
        return header;
    }
    return nil;
}

#pragma mark 协议方法UICollectionViewDelegateFlowLayout

// cell 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(375, 366);
    } else if (indexPath.section == 1) {
        return CGSizeMake(180, 135);
    } else if (indexPath.section == 2) {
        return CGSizeMake(365, 180);
    } else if (indexPath.section == 3) {
        return CGSizeMake(365, 200);
    } else if (indexPath.section == 4) {
        return CGSizeMake(365, 221);
    } else if (indexPath.section == 5) {
        return CGSizeMake(180, 149);
    }
    return CGSizeMake(365, 180);
}

// sectionHeader 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeZero;
    }
    return CGSizeMake(375, 35);
    //    return CGSizeZero;
}

@end
