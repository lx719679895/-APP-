//
//  ScrollUpView.m
//  ScrollUpView
//
//  Created by 李潇 on 16/3/14.
//  Copyright © 2016年 boai. All rights reserved.
//

#import "ScrollUpView.h"
#import "UIColor+Expanded.h"

#define TextColor [UIColor colorWithHexString:@"999999"]

@interface ScrollUpView(){
    
    NSTimer *_timer;
    int count; //取数组的第几个对象
    int flag; //标识当前是哪个view显示(currentView/hidenView)
    NSArray *_dataArr;
}

@property (nonatomic,strong) UIView *currentView;
@property (nonatomic,strong) UIView *hidenView;
@property (nonatomic,strong) UILabel *currentLabel;
@property (nonatomic,strong) UILabel *hidenLabel;
@end

@implementation ScrollUpView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    count = 0;
    flag = 0;
    
    self.layer.masksToBounds = YES;
    
    //创建定时器
    [self createTimer];
    [self createCurrentView];
    [self createHidenView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dealTap:)];
    [self addGestureRecognizer:tap];
}

- (void)setScrollUpViewDatas:(NSMutableArray *)dataArr
{
    _dataArr = dataArr;
    self.currentLabel.attributedText = _dataArr[count];
}

- (void)dealTap:(UITapGestureRecognizer *)tap
{
    self.clickBlock(count);
}

- (void)createTimer
{
    _timer=[NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(dealTimer) userInfo:nil repeats:YES];
}

#pragma mark - 滚动操作
-(void)dealTimer
{
    count++;
    if (count == _dataArr.count) {
        count = 0;
    }
    
    if (flag == 1) {
        self.currentLabel.attributedText = _dataArr[count];
    }
    
    if (flag == 0) {
        self.hidenLabel.attributedText = _dataArr[count];
    }
    
    
    if (flag == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.currentView.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
            self.hidenView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            flag = 1;
            self.currentView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
        }];
    }else{
        
        [UIView animateWithDuration:0.5 animations:^{
            self.hidenView.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
            self.currentView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            flag = 0;
            self.hidenView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.width);
        }];
    }
}

- (void)createCurrentView
{
    self.currentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.currentView];
    
    self.currentLabel = [[UILabel alloc]initWithFrame:self.currentView.frame];
    self.currentLabel.attributedText = _dataArr[count];
    self.currentLabel.textAlignment = NSTextAlignmentLeft;
    self.currentLabel.textColor = TextColor;
    self.currentLabel.font = [UIFont systemFontOfSize:13];
    [self.currentView addSubview:self.currentLabel];
}

- (void)createHidenView
{
    self.hidenView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.hidenView];
    
    self.hidenLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.hidenView.frame), CGRectGetHeight(self.hidenView.frame))];
    self.hidenLabel.text = @"";
    self.hidenLabel.textAlignment = NSTextAlignmentLeft;
    self.hidenLabel.textColor = TextColor;
    self.hidenLabel.font = [UIFont systemFontOfSize:13];
    [self.hidenView addSubview:self.hidenLabel];
}

- (void)stopTimer
{
    if ([_timer isValid] == YES) {
        [_timer invalidate];
        _timer = nil;
    }
}

@end
