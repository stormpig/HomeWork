//
//  ZKSectionHeader.m
//  我的手工客
//
//  Created by 曾凯 on 15-7-16.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "ZKSectionHeader.h"

@interface ZKSectionHeader ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pointerImageView;

@end

@implementation ZKSectionHeader

#pragma mark - 初始化函数

+ cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = NSStringFromClass([self class]);
    [collectionView registerClass:self forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier];
    return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier forIndexPath:indexPath];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, 375, 35)];
    [self pointerImageView];
    self.backgroundColor = [UIColor whiteColor];
    if (self) {
    }
    return self;
}



#pragma mark - Getter

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 7, 78, 21)];
        [self addSubview:label];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UIImageView *)pointerImageView
{
    if (_pointerImageView == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(342, 7, 15, 15)];
        view.image = [UIImage imageNamed:@"ws_homepage_arrow"];
        [self addSubview:view];
        _pointerImageView = view;
    }
    return _pointerImageView;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
