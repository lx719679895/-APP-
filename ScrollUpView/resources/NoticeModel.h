//
//  NoticeModel.h
//  GrabCoupons
//
//  Created by 李潇 on 15/12/3.
//  Copyright © 2015年 lixiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoticeModel : NSObject

/**
 *  中奖用户昵称
 */
@property (nonatomic,copy) NSString *nickname;
/**
 *  中奖物品名
 */
@property (nonatomic,copy) NSString *title;
@end
