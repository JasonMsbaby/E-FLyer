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
    [arr_personInfo addObject:[[MeInfoModel alloc]initWithIdd:@"username" Image:@"menu_person_name" Title:@"修改昵称" Content:user.username HaveNext:NO]];
    [arr_personInfo addObject:[[MeInfoModel alloc]initWithIdd:@"phone" Image:@"menu_person_phone" Title:@"绑定手机" Content:user.mobilePhoneNumber HaveNext:YES]];
    [arr_personInfo addObject:[[MeInfoModel alloc]initWithIdd:@"password" Image:@"menu_person_pwd" Title:@"修改密码" Content:@"******" HaveNext:YES]];
    [self.source setObject:arr_personInfo forKey:@"personInfo"];
    //店铺信息进入的设置
    NSMutableArray *arr_barInfo = [NSMutableArray array];
    [arr_barInfo addObject:[[MeInfoModel alloc]initWithIdd:@"barName" Image:@"menu_bar_name" Title:@"店铺名称" Content:user.barName HaveNext:NO]];
    [arr_barInfo addObject:[[MeInfoModel alloc]initWithIdd:@"barInfo" Image:@"menu_bar_info" Title:@"店铺简介" Content:user.barInfo HaveNext:NO]];
    [arr_barInfo addObject:[[MeInfoModel alloc]initWithIdd:@"barPhone" Image:@"menu_bar_phone" Title:@"店铺电话" Content:user.barPhone HaveNext:NO]];
    [arr_barInfo addObject:[[MeInfoModel alloc]initWithIdd:@"barAddress" Image:@"menu_bar_address" Title:@"店铺位置" Content:user.barAddress HaveNext:NO]];
    [arr_barInfo addObject:[[MeInfoModel alloc]initWithIdd:@"barImg" Image:@"menu_bar_img" Title:@"店铺图片" Content:@"修改图片" HaveNext:YES]];
    [self.source setObject:arr_barInfo forKey:@"barInfo"];
    //个人中心进入的设置
//    NSMutableArray *arr_personInfo = [NSMutableArray array];
//    [arr_personInfo addObject:[[MeInfoModel alloc]initWithIdd:@"" Image:@"me_setting" Title:@"修改昵称" Content:user.username]];
//    [arr_personInfo addObject:[[MeInfoModel alloc]initWithIdd:@"" Image:@"me_setting" Title:@"绑定手机" Content:user.mobilePhoneNumber]];
//    [arr_personInfo addObject:[[MeInfoModel alloc]initWithIdd:@"" Image:@"me_setting" Title:@"修改密码" Content:@"******"]];
//    [self.source setObject:arr_personInfo forKey:@"personInfo"];
}


- (instancetype)initWithIdd:(NSString *)idd Image:(NSString *)img Title:(NSString *)title Content:(NSString *)content HaveNext:(BOOL)haveNext{
    if (self = [super init]) {
        self.idd = idd;
        self.img = img;
        self.title = title;
        self.content = content;
        self.haveNext = haveNext;
    }
    return self;
}







@end
