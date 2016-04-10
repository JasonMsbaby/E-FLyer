//
//  MeMenu.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "MeMenu.h"
#import "ToolUtils.h"

@implementation MeMenu


- (id)initWithTitle:(NSString *)title Image:(NSString *)image{
    if (self = [super init]) {
        self.title = title;
        self.img = image;
        self.idd = [ToolUtils randomUUID];
    }
    return self;
}



+ (NSDictionary *)menuListWithUser:(EFUser *)currentUser{
    //商家个人菜单
    MeMenu *m1_1 = [[MeMenu alloc]initWithTitle:@"商家1" Image:@"me_setting"];
    MeMenu *m1_2 = [[MeMenu alloc]initWithTitle:@"商家2" Image:@"me_setting"];
    MeMenu *m1_3 = [[MeMenu alloc]initWithTitle:@"商家3" Image:@"me_setting"];
    MeMenu *m1_4 = [[MeMenu alloc]initWithTitle:@"退出登录" Image:@"me_setting"];
    NSArray *m1 = @[m1_1,m1_2,m1_3,m1_4];
    //个人菜单
    MeMenu *m11_1 = [[MeMenu alloc]initWithTitle:@"我的1" Image:@"me_setting"];
    MeMenu *m11_2 = [[MeMenu alloc]initWithTitle:@"我的2" Image:@"me_setting"];
    MeMenu *m11_3 = [[MeMenu alloc]initWithTitle:@"我的3" Image:@"me_setting"];
    MeMenu *m11_4 = [[MeMenu alloc]initWithTitle:@"我的4" Image:@"me_setting"];
    NSArray *m11 = @[m11_1,m11_2,m11_3,m11_4];
    
    //通用菜单
    MeMenu *m2_1 = [[MeMenu alloc]initWithTitle:@"设置1" Image:@"me_setting"];
    MeMenu *m2_2 = [[MeMenu alloc]initWithTitle:@"设置2" Image:@"me_setting"];
    MeMenu *m2_3 = [[MeMenu alloc]initWithTitle:@"设置3" Image:@"me_setting"];
    MeMenu *m2_4 = [[MeMenu alloc]initWithTitle:@"退出登录" Image:@"me_setting"];
    NSArray *m2 = @[m2_1,m2_2,m2_3,m2_4];
    
    if(currentUser.type == 0){
        return @{@"我的":m11,@"设置":m2};
    }else{
        return @{@"我的":m1,@"设置":m2};
    }
}
@end
