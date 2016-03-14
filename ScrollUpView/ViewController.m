//
//  ViewController.m
//  ScrollUpView
//
//  Created by 李潇 on 16/3/14.
//  Copyright © 2016年 boai. All rights reserved.
//

#import "ViewController.h"
#import "ScrollUpView.h"
#import "NoticeModel.h"
#import "UIColor+Expanded.h"

@interface ViewController ()
{
    NSMutableArray *_mutArr;
}
@property (weak, nonatomic) IBOutlet ScrollUpView *scrollUpView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mutArr = [NSMutableArray array];
    
    NoticeModel *notice1 = [[NoticeModel alloc] init];
    notice1.nickname = @"张三";
    notice1.title = @"iPhone 6s 64G 玫瑰金";
    [_mutArr addObject:notice1];
    
    NoticeModel *notice2 = [[NoticeModel alloc] init];
    notice2.nickname = @"李四";
    notice2.title = @"10元全网话费";
    [_mutArr addObject:notice2];
    
    NoticeModel *notice3 = [[NoticeModel alloc] init];
    notice3.nickname = @"王五";
    notice3.title = @"重庆特产米花糖1份";
    [_mutArr addObject:notice3];
    
    NoticeModel *notice4 = [[NoticeModel alloc] init];
    notice4.nickname = @"周六";
    notice4.title = @"小米手环 黑色标准";
    [_mutArr addObject:notice4];
    
    NoticeModel *notice5 = [[NoticeModel alloc] init];
    notice5.nickname = @"我要中大奖";
    notice5.title = @"卡通造型护眼充电台灯";
    [_mutArr addObject:notice5];
    
    [self creatView];
    
    [self createNoticeView];
}

- (void)creatView
{
    [_scrollUpView createUI];
    _scrollUpView.clickBlock = ^(NSInteger index){
        NoticeModel *noticeModel = _mutArr[index];
        NSLog(@"恭喜%@获得了%@",noticeModel.nickname,noticeModel.title);
    };
}

- (void)createNoticeView
{
    NSMutableArray *datas = [NSMutableArray array];
    
    for (NoticeModel *noticeModel in _mutArr) {
        NSString *noticeStr = [NSString stringWithFormat:@"恭喜%@获得了%@",noticeModel.nickname,noticeModel.title];
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:noticeStr];
        
        [attString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"3591f5"] range:NSMakeRange(2,noticeModel.nickname.length)];
        [attString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"333333"] range:NSMakeRange(5+noticeModel.nickname.length,noticeModel.title.length)];
        [datas addObject:attString];
    }
    
    [_scrollUpView setVerticalShowDataArr:datas];
}

- (void)dealloc
{
    [_scrollUpView stopTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
