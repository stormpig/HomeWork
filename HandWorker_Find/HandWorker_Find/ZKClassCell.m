//
//  ZKClassCell.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKClassCell.h"

@interface ZKClassCell ()

@property (weak, nonatomic) UIView *wView;
@property (weak, nonatomic) IBOutlet UIImageView *classImageView;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;

@end

@implementation ZKClassCell

#pragma mark 初始化函数

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, 180, 131)];
    if (self) {
    }
    return self;
}

#pragma mark - Getter 

- (UIView *)wView
{
    if (_wView == nil) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(-5, -5, 190, 141)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        _wView = view;
    }
    return _wView;
}

- (UIImageView *)classImageView
{
    if (_classImageView == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 180, 90)];
        [self addSubview:view];
        _classImageView = view;
    }
    return _classImageView;
}

- (UILabel *)classLabel
{
    if (_classLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(22, 95, 137, 36)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = NORMALFONT;
        label.numberOfLines = 0;
        [self addSubview:label];
        _classLabel = label;
    }
    return  _classLabel;
}

- (void)setClassN:(ZKClass *)classN
{
    _classN = classN;
    [self wView];
    [self.classImageView setImageWithURL:[NSURL URLWithString:classN.host_pic]];
    self.classLabel.text = classN.subject;
}

- (void)awakeFromNib {
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

@end
