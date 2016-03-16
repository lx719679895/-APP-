# ScrollUpView
仿夺宝APP中奖公告展示，中奖名单向上滚动

## 展示效果
![github](https://github.com/lx719679895/ScrollUpView/blob/master/Untitled.gif)

## 示例代码
### 设置UI
    - (void)creatView
    {
    //如果用代码手写scrollUpView的frame直接用下面初始化方法，
    //_scrollUpView = [[ScrollUpView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 36)];
    
    //xib设置scrollUpView需要调用createUI方法
    [_scrollUpView createUI];
    
    //scrollUpView点击回调
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
    
    //设置scrollUpView数据源
    [_scrollUpView setScrollUpViewDatas:datas];
    }
