//
//  ZKProductCell.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKProductCell.h"

@interface ZKProductCell ()

@property (weak, nonatomic) UIImageView *picImageView;
@property (weak, nonatomic) UILabel *subjectLabel;

@end

@implementation ZKProductCell

#pragma mark - 初始化函数

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, 375, 35)];
    if (self) {
    }
    return self;
}

#pragma mark - Getter

- (UIImageView *)picImageView
{
    if (_picImageView == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 365, 180)];
        [self addSubview:view];
        _picImageView = view;
    }
    return _picImageView;
}

- (UILabel *)subjectLabel
{
    if (_subjectLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 365, 185, 25)];
        label.font = NORMALFONT;
        [self addSubview:label];
        _subjectLabel = label;
    }
    return _subjectLabel;
}

- (void)setProduct:(ZKProduct *)product
{
    _product = product;
    [self.picImageView setImageWithURL:[NSURL URLWithString:product.host_pic]];
    self.subjectLabel.text = product.subject;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
