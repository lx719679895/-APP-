//
//  ScrollUpView.h
//  ScrollUpView
//
//  Created by 李潇 on 16/3/14.
//  Copyright © 2016年 boai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollUpView : UIView

/**
 *  标记点击了第几个
 */
@property (nonatomic,copy) void (^clickBlock)(NSInteger index);

/**
 *  初始化UI
 */
- (void)createUI;

/**
 *  填充view数据
 *
 *  @param dataArr 数组
 */
- (void)setVerticalShowDataArr:(NSMutableArray *)dataArr;

/**
 *  启动定时器开始滚动
 */
- (void)createTimer;

/**
 *  界面消失停止定时器，否则会导致内存泄露
 */
- (void)stopTimer;

@end
