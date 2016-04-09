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


+(NSDictionary *)menuList{
    MeMenu *m1_1 = [[MeMenu alloc]initWithTitle:@"我的1" Image:@"me_setting"];
    MeMenu *m1_2 = [[MeMenu alloc]initWithTitle:@"我的2" Image:@"me_setting"];
    MeMenu *m1_3 = [[MeMenu alloc]initWithTitle:@"我的3" Image:@"me_setting"];
    MeMenu *m1_4 = [[MeMenu alloc]initWithTitle:@"退出登录" Image:@"me_setting"];
    NSArray *m1 = @[m1_1,m1_2,m1_3,m1_4];
    
    
    MeMenu *m2_1 = [[MeMenu alloc]initWithTitle:@"设置1" Image:@"me_setting"];
    MeMenu *m2_2 = [[MeMenu alloc]initWithTitle:@"设置2" Image:@"me_setting"];
    MeMenu *m2_3 = [[MeMenu alloc]initWithTitle:@"设置3" Image:@"me_setting"];
    MeMenu *m2_4 = [[MeMenu alloc]initWithTitle:@"设置4" Image:@"me_setting"];
    NSArray *m2 = @[m2_1,m2_2,m2_3,m2_4];
    
    return @{@"我的":m1,@"设置":m2};
}
@end
