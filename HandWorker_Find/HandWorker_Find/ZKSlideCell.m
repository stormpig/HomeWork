//
//  ZKSlideCell.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKSlideCell.h"
#import "ZKSlide.h"
#import "UIImageView+AFNetworking.h"
#import "ZKNav.h"
#import "ZKAdv.h"

@interface ZKSlideCell ()

@property (weak, nonatomic) UIScrollView *sliderScrollView;

@property (weak, nonatomic) UIView *wView;

@property (weak, nonatomic) UIImageView *navImageView1;
@property (weak, nonatomic) UIImageView *navImageView2;
@property (weak, nonatomic) UIImageView *navImageView3;
@property (weak, nonatomic) UIImageView *navImageView4;

@property (weak, nonatomic) UILabel *navLabel1;
@property (weak, nonatomic) UILabel *navLabel2;
@property (weak, nonatomic) UILabel *navLabel3;
@property (weak, nonatomic) UILabel *navLabel4;

@property (weak, nonatomic) UIImageView *advImageView1;
@property (weak, nonatomic) UIImageView *advImageView2;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ZKSlideCell

#pragma mark 初始化函数

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, 375, 366)];
    if (self) {
        
    }
    return self;
}

#pragma mark - Getter

- (NSTimer *)timer
{
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changePic) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (UIView *)wView
{
    if (_wView == nil) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 375, 126)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        _wView = view;
    }
    return _wView;
}

- (UIScrollView *)sliderScrollView
{
    if (_sliderScrollView == nil) {
        UIScrollView * view = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 150)];
        view.pagingEnabled = YES;
        view.showsHorizontalScrollIndicator = NO;
        view.showsVerticalScrollIndicator = NO;
        [self addSubview:view];
        _sliderScrollView = view;
    }
    return _sliderScrollView;
}

- (UIImageView *)navImageView1
{
    if (_navImageView1 == nil) {
        UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(18, 17 + 150, 60, 60)];
        [self addSubview:view];
        _navImageView1 = view;
    }
    return _navImageView1;
}

- (UIImageView *)navImageView2
{
    if (_navImageView2 == nil) {
        UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(105, 17 + 150, 60, 60)];
        [self addSubview:view];
        _navImageView2 = view;
    }
    return _navImageView2;
}

- (UIImageView *)navImageView3
{
    if (_navImageView3 == nil) {
        UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(200, 17 + 150, 60, 60)];
        [self addSubview:view];
        _navImageView3 = view;
    }
    return _navImageView3;
}

- (UIImageView *)navImageView4
{
    if (_navImageView4 == nil) {
        UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(296, 17 + 150, 60, 60)];
        [self addSubview:view];
        _navImageView4 = view;
    }
    return _navImageView4;
}

- (UILabel *)navLabel1
{
    if (_navLabel1 == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(27, 85 + 150, 42, 21)];
        label.font = [UIFont systemFontOfSize:14];
        [self addSubview:label];
        _navLabel1 = label;
    }
    return _navLabel1;
}

- (UILabel *)navLabel2
{
    if (_navLabel2 == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(114, 85 + 150, 42, 21)];
        label.font = [UIFont systemFontOfSize:14];
        [self addSubview:label];
        _navLabel2 = label;
    }
    return _navLabel2;
}

- (UILabel *)navLabel3
{
    if (_navLabel3 == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(209, 85 + 150, 42, 21)];
        label.font = [UIFont systemFontOfSize:14];
        [self addSubview:label];
        _navLabel3 = label;
    }
    return _navLabel3;
}

- (UILabel *)navLabel4
{
    if (_navLabel4 == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(305, 85 + 150, 42, 21)];
        label.font = [UIFont systemFontOfSize:14];
        [self addSubview:label];
        _navLabel4 = label;
    }
    return _navLabel4;
}

- (UIImageView *)advImageView1
{
    if (_advImageView1 == nil) {
        UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 277, 187, 89)];
        [self addSubview:view];
        _advImageView1 = view;
    }
    return _advImageView1;
}

- (UIImageView *)advImageView2
{
    if (_advImageView2 == nil) {
        UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(188, 277, 187, 89)];
        [self addSubview:view];
        _advImageView2 = view;
    }
    return _advImageView2;
}

#pragma mark - Setter

- (void)setSlides:(NSArray *)slides
{
    _slides = slides;
    //    setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    CGFloat pWidth = self.sliderScrollView.frame.size.width;
    CGFloat pHeight = self.sliderScrollView.frame.size.height;
    int i;
    for (i = 0; i < slides.count; i++) {
        ZKSlide *slide = slides[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * pWidth, 0, pWidth, pHeight)];
        [imageView setImageWithURL:[NSURL URLWithString:slide.host_pic]];
        [self.sliderScrollView addSubview:imageView];
    }
    self.sliderScrollView.contentSize = CGSizeMake(pWidth * i, pHeight);
    [self wView];
    // 启动定时器
    [self timer];
}

- (void)setNavs:(NSArray *)navs
{
    _navs = navs;
    NSArray *navImageViews = @[self.navImageView1, self.navImageView2, self.navImageView3, self.navImageView4];
    NSArray *navLabels = @[self.navLabel1, self.navLabel2, self.navLabel3, self.navLabel4];
    for (int i = 0; i < 4; i++) {
        ZKNav *nav = navs[i];
        [(UIImageView *)navImageViews[i] setImageWithURL:[NSURL URLWithString:nav.host_pic]];
        ((UILabel *)navLabels[i]).text = nav.subject;
    }
}

- (void)changePic
{
    CGPoint offset = self.sliderScrollView.contentOffset;
    offset.x += 375;
    offset.x  = (NSInteger)offset.x % (375 * (self.slides.count - 1));
    if (offset.x == 0) {
        self.sliderScrollView.contentOffset = offset;
    } else {
        [UIView animateWithDuration:1 animations:^{
            self.sliderScrollView.contentOffset = offset;
        }];
    }
}

- (void)setAdvs:(NSArray *)advs
{
    _advs = advs;
    [self.advImageView1 setImageWithURL:[NSURL URLWithString:((ZKAdv *)advs[0]).ad_img]];
    [self.advImageView2 setImageWithURL:[NSURL URLWithString:((ZKAdv *)advs[1]).ad_img]];
}

- (void)awakeFromNib {
    // Initialization code
}

@end
