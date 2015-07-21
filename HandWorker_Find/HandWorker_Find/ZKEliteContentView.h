//
//  ZKEliteContentView.h
//  HandWorker_Find
//
//  Created by 曾凯 on 15-7-20.
//  Copyright (c) 2015年 dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKEliteContentView : UIView

@property (strong, nonatomic) NSArray *models;

+ (id)viewWithModels:(NSArray *)models;
- (id)initWithModels:(NSArray *)models;
@end
