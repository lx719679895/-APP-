# ScrollUpView
仿夺宝APP中奖公告展示，中奖名单向上滚动

## 展示效果
![github](https://github.com/lx719679895/ScrollUpView/blob/master/Untitled.gif)

## 示例代码
### 设置UI
    - (void)creatView
    {
    [_scrollUpView createUI];
    _scrollUpView.clickBlock = ^(NSInteger index){
        NoticeModel *noticeModel = _mutArr[index];
        NSLog(@"恭喜%@获得了%@",noticeModel.nickname,noticeModel.title);
    };
    }

### 填充数据
    - (void)createNoticeView
    {
    NSMutableArray *datas = [NSMutableArray array];
    
    for (NoticeModel *noticeModel in _mutArr) {
        NSString *noticeStr = [NSString stringWithFormat:@"恭喜%@获得了%@",noticeModel.nickname,noticeModel.title];
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:noticeStr];
        
        [attString addAttribute:NSForegroundColorAttributeName 
                   value:[UIColor colorWithHexString:@"3591f5"] 
                   range:NSMakeRange(2,noticeModel.nickname.length)];
        [attString addAttribute:NSForegroundColorAttributeName 
                   value:[UIColor colorWithHexString:@"333333"] 
                   range:NSMakeRange(5+noticeModel.nickname.length,noticeModel.title.length)];
                   
        [datas addObject:attString];
    }
    
    [_scrollUpView setVerticalShowDataArr:datas];
    }
