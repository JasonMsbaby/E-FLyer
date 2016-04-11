//
//  HouseListModelTwo.h
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HouseListModelTwo : NSObject
//adTitle
@property (nonatomic, retain)NSString *adTitle;
//简介
@property (nonatomic, copy)NSString *digest;
//详情页拼接URL
@property (nonatomic ,copy)NSString *docid;
//imgextra图片数组
@property (nonatomic, copy)NSArray *imgextra;
@property(nonatomic,copy)NSString * middleImageViewStr;
@property(nonatomic,copy)NSString * rightImageViewStr;

//图片URL
@property (nonatomic ,copy)NSString *imgsrc;
//lmodify
@property (nonatomic, copy)NSString *lmodify;
//photosetID
@property (nonatomic, copy)NSString *photosetID;
//priority
@property (nonatomic, copy)NSNumber * priority;
//ptime发表时间
@property (nonatomic, copy)NSString *ptime;
//replyCount跟帖计数(NSNumber转换为NSString)
@property (nonatomic, copy)NSNumber *replyCount;
//skipID
@property (nonatomic, copy)NSString *skipID;
//skipType
@property (nonatomic, copy)NSString *skipType;
//source新闻来源
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

-(void)setValue:(id)value forUndefinedKey:(NSString *)key;




@end
