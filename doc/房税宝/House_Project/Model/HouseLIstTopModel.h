//
//  HouseLIstTopModel.h
//  House_Project
//
//  Created by lanou3g on 14-10-10.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HouseLIstTopModel : NSObject
//图片URL
@property (nonatomic, retain)NSString *adTitle;
//图片发表时间
@property (nonatomic, retain)NSString *alias;
//标题
@property (nonatomic, retain)NSString *cid;
@property (nonatomic, retain)NSString *digest;
@property (nonatomic, retain)NSString *docid;
@property (nonatomic, retain)NSString *ename;
@property (nonatomic, retain)NSString *hasCover;
@property (nonatomic, retain)NSString *hasHead;
@property (nonatomic, retain)NSString *HasIcon;
@property (nonatomic, retain)NSString *hasImg;
@property (nonatomic, retain)NSString *imgsrc;


@property (nonatomic, retain)NSString *lmodify;
@property (nonatomic, retain)NSString *order;
@property (nonatomic, retain)NSString *priority;
@property (nonatomic, retain)NSString *ptime;
@property (nonatomic, retain)NSString *replyCount;
@property (nonatomic, retain)NSString *source;
@property (nonatomic, retain)NSString *subtitle;
@property (nonatomic, retain)NSString * template;
@property (nonatomic, retain)NSString * timeConsuming;

@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSString *tname;
@property (nonatomic, retain)NSString * url;
@property (nonatomic, retain)NSString * url_3w;


-(void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
