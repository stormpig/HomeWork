//
//  ZKCourseCell.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKCourseCell.h"

@interface ZKCourseCell ()

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avtarImageView;
@property (weak, nonatomic) IBOutlet UIImageView *darenImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ZKCourseCell

#pragma mark - 初始化函数

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *wView = [[UIView alloc] initWithFrame:CGRectMake(-5, -5, 190, 159)];
        wView.backgroundColor = [UIColor whiteColor];
        [self addSubview:wView];
    }
    return self;
}


#pragma mark - Getter

- (UIImageView *)picImageView
{
    if (_picImageView == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 180, 90)];
        [self addSubview:view];
        _picImageView = view;
    }
    return _picImageView;
}

- (UILabel *)subjectLabel
{
    if (_subjectLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 180, 27)];
        label.font = NORMALFONT;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _subjectLabel = label;
    }
    return _subjectLabel;
}

- (UIImageView *)avtarImageView
{
    if (_avtarImageView == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(14, 116, 25, 25)];
        [self addSubview:view];
        _avtarImageView = view;
    }
    return _avtarImageView;
}

- (UIImageView *)darenImageView
{
    if (_darenImageView == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(49, 126, 15, 15)];
        [self addSubview:view];
        _darenImageView = view;
    }
    return _darenImageView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(72, 123, 104, 21)];
        label.font = NORMALFONT;
        label.textColor = [UIColor orangeColor];
        [self addSubview:label];
        _nameLabel = label;
    }
    return _nameLabel;
}

- (void)setCourse:(ZKCourse *)course
{
    _course = course;
    [self.picImageView setImageWithURL:[NSURL URLWithString:course.host_pic]];
    self.subjectLabel.text = course.subject;
    [self.avtarImageView setImageWithURL:[NSURL URLWithString:course.avatar]];
    self.avtarImageView.layer.cornerRadius = self.avtarImageView.frame.size.width / 2;
    self.avtarImageView.clipsToBounds = YES;
    CGRect nFrame = self.nameLabel.frame;
#warning 计算Label的位置还存在问题
    if ([course.is_daren isEqualToString:@"1"]) {
        self.darenImageView.image = [UIImage imageNamed:@"userIdentifer"];
        nFrame.origin.x  = CGRectGetMaxX(self.darenImageView.frame) + 5;
    } else {
        nFrame.origin.x  = CGRectGetMaxX(self.avtarImageView.frame) + 5;
        self.darenImageView.image = nil;
    }
    NSLog(@"%@", NSStringFromCGRect(nFrame));
    self.nameLabel.frame = nFrame;
    self.nameLabel.text = course.user_name;
}

- (void)awakeFromNib {
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

@end
