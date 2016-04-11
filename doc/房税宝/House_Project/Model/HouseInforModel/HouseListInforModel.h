//
//  HouseListInforModel.h
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HouseListInforModel : NSObject
//body内容
@property (nonatomic, copy)NSString *body;
//digest导语
@property (nonatomic, copy)NSString *digest;
//发表时间ptime
@property (nonatomic, copy)NSString *ptime;
//source新闻来源
@property (nonatomic, copy)NSString *source;
//title标题
@property (nonatomic, copy)NSString *title;



@end
