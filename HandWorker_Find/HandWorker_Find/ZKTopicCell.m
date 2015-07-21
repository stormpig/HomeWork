//
//  ZKTopicCell.m
//  我的手工客
//
//  Created by ZengKai on 15/7/17.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKTopicCell.h"

@interface ZKTopicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *picImageView0;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView4;
@property (weak, nonatomic) IBOutlet UILabel *subjectLabel;

@end

@implementation ZKTopicCell

#pragma mark - 初始化方法

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - Getter 

- (UIImageView *)picImageView0
{
    if (_picImageView0 == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 180, 180)];
        [self addSubview:view];
        _picImageView0 = view;
    }
    return _picImageView0;
}

- (UIImageView *)picImageView1
{
    if (_picImageView1 == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(183, 0, 89, 89)];
        [self addSubview:view];
        _picImageView1 = view;
    }
    return _picImageView1;
}

- (UIImageView *)picImageView2
{
    if (_picImageView2 == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(276, 0, 89, 89)];
        [self addSubview:view];
        _picImageView2 = view;
    }
    return _picImageView2;
}

- (UIImageView *)picImageView3
{
    if (_picImageView3 == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(183, 91, 89, 89)];
        [self addSubview:view];
        _picImageView3 = view;
    }
    return _picImageView3;
}

- (UIImageView *)picImageView4
{
    if (_picImageView4 == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(276, 91, 89, 89)];
        [self addSubview:view];
        _picImageView4 = view;
    }
    return _picImageView4;
}

- (UILabel *)subjectLabel
{
    if (_subjectLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, 365, 41)];
        [self addSubview:label];
        label.font = NORMALFONT;
        label.textAlignment = NSTextAlignmentCenter;
        _subjectLabel = label;
    }
    return _subjectLabel;
}

- (void)setTopic:(ZKTopic *)topic
{
    _topic = topic;
    NSArray *pices = @[self.picImageView0, self.picImageView1, self.picImageView2, self.picImageView3, self.picImageView4];
    int i = 0;
    for (NSString *picURL in topic.pic) {
        [(UIImageView *)pices[i++] setImageWithURL:[NSURL URLWithString:picURL]];
    }
    self.subjectLabel.text = topic.subject;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
