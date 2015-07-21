//
//  ZKDarenCell.m
//  我的手工客
//
//  Created by ZengKai on 15/7/16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKDarenCell.h"
#import "UIImage+ResizeImage.h"

@interface ZKDarenCell ()

@property (weak, nonatomic) UIImageView *bgImageView;
@property (weak, nonatomic) UIImageView *avatarImageView;
@property (weak, nonatomic) UILabel *unameLabel;
@property (weak, nonatomic) UIImageView *genderImageView;
@property (weak, nonatomic) UILabel *regionLabel;
@property (weak, nonatomic) UILabel *coursecountLabel;
@property (weak, nonatomic) UILabel *fen_numLabel;
@property (weak, nonatomic) UILabel *circle_countLabel;
@property (weak, nonatomic) UIButton *guan_statusButton;
@property (weak, nonatomic) UIActivityIndicatorView *guanIndicator;

@end

@implementation ZKDarenCell

#pragma mark - 初始化函数

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, 365, 200)];
    if (self) {
        UILabel *cLabel = [[UILabel alloc] initWithFrame:CGRectMake(66, 133, 25, 21)];
        cLabel.text = @"教程";
        cLabel.font = [UIFont systemFontOfSize:12];
        cLabel.textColor = [UIColor whiteColor];
        [self addSubview:cLabel];
        
        UILabel *fLabel = [[UILabel alloc] initWithFrame:CGRectMake(141, 133, 25, 21)];
        fLabel.text = @"粉丝";
        fLabel.font = [UIFont systemFontOfSize:12];
        fLabel.textColor = [UIColor whiteColor];
        [self addSubview:fLabel];
        
        UILabel *sLabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 134, 39, 21)];
        sLabel.text = @"手工圈";
        sLabel.font = [UIFont systemFontOfSize:12];
        sLabel.textColor = [UIColor whiteColor];
        [self addSubview:sLabel];
    }
    return self;
}

#pragma mark - Getter

- (UIImageView *)bgImageView
{
    if (_bgImageView == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 365, 200)];
        [self addSubview:view];
        _bgImageView = view;
    }
    return _bgImageView;
}

- (UIImageView *)avatarImageView
{
    if (_avatarImageView == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(147, 0, 70, 70)];
        [self addSubview:view];
        _avatarImageView = view;
    }
    return _avatarImageView;
}

- (UILabel *)unameLabel
{
    if (_unameLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(147, 79, 71, 21)];
        label.textColor = [UIColor whiteColor];
        label.font = NORMALFONT;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _unameLabel = label;
    }
    return _unameLabel;
}

- (UIImageView *)genderImageView
{
    if (_genderImageView == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(226, 80, 15, 15)];
        [self addSubview:view];
        _genderImageView = view;
    }
    return _genderImageView;
}

- (UILabel *)regionLabel
{
    if (_regionLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(161, 108, 42, 21)];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _regionLabel = label;
    }
    return _regionLabel;
}


- (UILabel *)coursecountLabel
{
    if (_coursecountLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(94, 134, 50, 21)];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _coursecountLabel = label;
    }
    return _coursecountLabel;
}

- (UILabel *)fen_numLabel
{
    if (_fen_numLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(168, 134, 56, 21)];
        label.font = [UIFont systemFontOfSize:12];
        [self addSubview:label];
        _fen_numLabel = label;
    }
    return _fen_numLabel;
}

- (UILabel *)circle_countLabel
{
    if (_circle_countLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(257, 134, 67, 21)];
        label.font = [UIFont systemFontOfSize:12];
        [self addSubview:label];
        _circle_countLabel = label;
    }
    return _circle_countLabel;
}

- (UIButton *)guan_statusButton
{
    if (_guan_statusButton == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(142, 161, 80, 30);
        [button setTitle:@"关注" forState:UIControlStateNormal];
        button.titleLabel.font = NORMALFONT;
        button.tintColor = [UIColor whiteColor];
        [button addTarget:self action:@selector(guanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        _guan_statusButton = button;
    }
    return _guan_statusButton;
}

- (UIActivityIndicatorView *)guanIndicator
{
    if (_guanIndicator == nil) {
        UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(172, 170, 20, 20)];
        view.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
        [self addSubview:view];
        _guanIndicator = view;
    }
    return _guanIndicator;
}

- (void)setDaren:(ZKDaren *)daren
{
    _daren = daren;
    [self.bgImageView setImageWithURL:[NSURL URLWithString:daren.bg_image]];
    [self.avatarImageView setImageWithURL:[NSURL URLWithString:daren.avatar]];
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width / 2;
    self.avatarImageView.layer.borderWidth = 2.0f;
    self.avatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.avatarImageView.clipsToBounds = YES;
    self.unameLabel.text = daren.uname;
//    self.genderImageView
    self.regionLabel.text = daren.region;
    self.coursecountLabel.text = daren.coursecount;
    self.fen_numLabel.text = daren.fen_num;
    self.circle_countLabel.text = daren.circle_count;
    [self.guan_statusButton setBackgroundImage:[UIImage resizableImageNamed:@"ws_photo_unselected"] forState:UIControlStateNormal];
    self.guan_statusButton.tintColor = [UIColor whiteColor];
}

#pragma mark - 事件响应方法


- (void)guanButtonClick:(id)sender {
    UIButton *button = sender;
    static NSInteger i = 0;
    [button setTitle:@"" forState:UIControlStateNormal];
    [self.guanIndicator startAnimating];
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [self.guanIndicator stopAnimating];
        if ((i++ % 2) == 0) {
            [button setTitle:@"已关注" forState:UIControlStateNormal];
        } else {
            [button setTitle:@"关注" forState:UIControlStateNormal];
        }
    });
}


- (void)awakeFromNib {
    // Initialization code
}

@end
