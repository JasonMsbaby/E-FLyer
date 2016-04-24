//
//  App.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/9.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "App.h"

@implementation App
static App *app = nil;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupErrorCode];
    }
    return self;
}

+ (instancetype)sharedApp{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        app = [[self alloc] init];
    });
    return app;
}
/*!
 *  配置错误信息
 */
- (void)setupErrorCode{
    self.kCode = @{
                   @"code_6":@"网络似乎开小差了~",
                   @"code_28":@"请求超时",
                   @"code_127":@"请输入有效的手机号码",
                   @"code_210":@"密码错误",
                   @"code_211":@"用户不存在",
                   @"code_214":@"用户已存在,请登录",
                   @"code_215":@"手机号不可用",
                   @"code_603":@"验证码错误,请重新输入"
                   };
}

@end
