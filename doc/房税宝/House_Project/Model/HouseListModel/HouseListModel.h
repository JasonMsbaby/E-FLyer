//
//  HouseListModel.h
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HouseListModel : NSObject
//adTitle
@property (nonatomic, retain)NSString *adTitle;
//简介
@property (nonatomic, copy)NSString *digest;
//详情页拼接URL
@property (nonatomic ,copy)NSString *docid;
//图片URL
@property (nonatomic ,copy)NSString *imgsrc;
//lmodify
@property (nonatomic, copy)NSString *lmodify;
//priority
@property (nonatomic, copy)NSNumber * priority;
//ptime
@property (nonatomic, copy)NSString *ptime;
//replyCount跟帖计数(NSNumber转换为NSString)
@property (nonatomic, copy)NSNumber *replyCount;
//source
@property (nonatomic, copy)NSString *source;
//subtitle
@property (nonatomic, copy)NSString *subtitle;
//timeConsuming
@property (nonatomic, copy)NSString *timeConsuming;
//标题
@property (nonatomic, copy)NSString *title;
//url
@property (nonatomic , copy)NSString *url;
//url_3w
@property (nonatomic, copy)NSString *url_3w;

@end
