//
//  MeInfoModel.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/17.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFUser.h"
#import "MeInfoModel.h"

@implementation MeInfoModel
static MeInfoModel *model;
+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[MeInfoModel alloc] init];
    });
    return model;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.source = [NSMutableDictionary dictionary];
        [self initData];
    }
    return self;
}

- (void)initData{
    EFUser *user = [EFUser currentUser];
    //个人中心进入的设置
    NSMutableArray *arr_personInfo = [NSMutableArray array];
    [arr_personInfo addObject:[[MeInfoModel alloc]initWithIdd:@"" Image:@"me_setting" Title:@"修改昵称" Content:user.username]];
    [arr_personInfo addObject:[[MeInfoModel alloc]initWithIdd:@"" Image:@"me_setting" Title:@"绑定手机" Content:user.mobilePhoneNumber]];
    [arr_personInfo addObject:[[MeInfoModel alloc]initWithIdd:@"" Image:@"me_setting" Title:@"修改密码" Content:@"******"]];
//    [arr_personInfo addObject:[[MeInfoModel alloc]initWithIdd:@"" Image:@"meun_setting" Title:@"修改昵称" Content:user.username]];
//    [arr_personInfo addObject:[[MeInfoModel alloc]initWithIdd:@"" Image:@"meun_setting" Title:@"修改昵称" Content:user.username]];
    [self.source setObject:arr_personInfo forKey:@"personInfo"];
}


- (instancetype)initWithIdd:(NSString *)idd Image:(NSString *)img Title:(NSString *)title Content:(NSString *)content{
    if (self = [super init]) {
        self.idd = idd;
        self.img = img;
        self.title = title;
        self.content = content;
    }
    return self;
}







@end
