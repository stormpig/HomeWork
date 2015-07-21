//
//  ViewController.m
//  MonkeyUITouchDemo
//
//  Created by 曾凯 on 15-7-21.
//  Copyright (c) 2015年 曾凯. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    UITouch *_preTouch;
}

@property (weak, nonatomic) UIImageView *monkey;
@property (weak, nonatomic) UIImageView *banana;
@property (assign, nonatomic) NSInteger count;
@property (strong, nonatomic) AVAudioPlayer *player;

@end

@implementation ViewController

#pragma mark - Getter

- (UIImageView *)monkey
{
    if (_monkey == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
        view.image = [UIImage imageNamed:@"monkey"];
        view.center = self.view.center;
        [self.view addSubview:view];
        _monkey = view;
    }
    return _monkey;
}

- (UIImageView *)banana
{
    if (_banana == nil) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
        view.image = [UIImage imageNamed:@"banana"];
        [self.view addSubview:view];
        _banana = view;
    }
    return _banana;
}

- (AVAudioPlayer *)player
{
    if (_player == nil) {
        NSURL *URL = [NSURL fileURLWithPath:@"/Users/ms/Desktop/HomeWork/MonkeyUITouchDemo/MonkeyUITouchDemo/Resources/tickleSound.wav"];
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:URL error:nil];
    }
    return _player;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch  *touch = touches.anyObject;
    NSTimeInterval delaytime = 0.5;// 自己根据需要调整
    
    switch (touch.tapCount) {
        case 1:
            [self performSelector:@selector(singleTap:) withObject:touch afterDelay:delaytime];
            _preTouch = touch;
            break;
        case 2:
            [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(singleTap:) object:_preTouch];
            [self performSelector:@selector(doubleTap:) withObject:touch afterDelay:delaytime];
            break;
        default:
            break;
    }
}

- (void)singleTap:(UITouch *)touch
{
    CGPoint center = [touch locationInView:self.view];
    self.monkey.center = center;
}

- (void)doubleTap:(UITouch *)touch
{
//    [self.player play];
    self.view.backgroundColor = [[UIColor alloc] initWithRed:(float)(arc4random() % 256 / 255.0f) green:(float)(arc4random() % 256 / 255.0f) blue:(float)(arc4random() % 256 / 255.0f) alpha:0.8];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved");
    UITouch  *touch = touches.anyObject;
    CGPoint center = [touch locationInView:self.view];
    self.monkey.center = center;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.count = 0;
    [self monkey];
    [self banana];
    [self.monkey addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:nil];
    
    self.title = @"0";
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
    NSLog(@"MonkeyFrame:%@", NSStringFromCGRect(self.monkey.frame));
    NSLog(@"MonkeyCenter:%@", NSStringFromCGPoint(self.monkey.center));
    NSLog(@"self.view.center:%@", NSStringFromCGPoint(self.view.center));
    [UIView animateWithDuration:1 animations:^{
        CGPoint center = self.view.center;
        center.y = center.y - self.view.frame.origin.y;
        center.x = center.x - self.view.frame.origin.x;
        self.monkey.center = center;
        
    }];
}

//- (void)viewDidAppear:(BOOL)animated

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    CGRect rect = CGRectInset(self.view.bounds,100, 100);
    if (!CGRectIntersectsRect(rect, self.monkey.frame)) {
        self.view.layer.borderColor = [UIColor redColor].CGColor;
        self.view.layer.borderWidth = 3;
    } else {
        self.view.layer.borderColor = [UIColor clearColor].CGColor;
    }
    
    if (CGRectIntersectsRect(self.monkey.frame, self.banana.frame)) {
        self.count++;
        [self.player play];
        self.title = [NSString stringWithFormat:@"%ld", self.count];
        self.banana.center = CGPointMake(self.view.frame.size.width * (arc4random() % 10) / 10, self.view.frame.size.height * (arc4random() % 10) / 10);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
