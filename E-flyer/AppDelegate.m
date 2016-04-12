//
//  AppDelegate.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/26.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <SVProgressHUD.h>
#import "EFCity.h"
#import "EFCrowd.h"
#import <IQKeyboardManager.h>
#import "AppDelegate.h"
#import <AVOSCloud.h>
#import "EFUser.h"
#import "EFCategroy.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self loadLeanCloud];
    [self initData];
    //初始化一些基本数据
    [self loading];
    [self setUpIQKeyboardManager];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

#pragma mark - 加载LeanCloud

- (void)loadLeanCloud{
    // applicationId 即 App Id，clientKey 是 App Key。
    [AVOSCloud setApplicationId:@"eSm9E00yp6Gm0TUWkXTsgbvg-gzGzoHsz"
                      clientKey:@"ib4p3IlsTdaMRmKEdEQUjFM0"];
}

#pragma mark - 初始化数据


- (void)setUpIQKeyboardManager{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
}


- (void)loading{
    [SVProgressHUD showWithStatus:@"正在初始化,请稍后..."];
    [[EFCrowd shareInstance] initFromRemote];
    [[EFCategroy shareInstance]initWithRemote];
    [SVProgressHUD dismiss];
}

- (void)initData{
    //初始化分类信息
    /*NSArray *arr = @[@"新品新店",@"吃货世界",@"服饰美妆",@"低价专享",@"家用电器",@"学生党",@"金融理财",@"房产家具"];
    for (NSString *name in arr) {
        EFCategroy *categroy = [EFCategroy object];
        categroy.name = name;
        UIImage *img = [UIImage imageNamed:@"demo_meishi"];
        AVFile *file = [AVFile fileWithData:UIImagePNGRepresentation(img)];
        categroy.image = file;
        categroy.index = (int)[arr indexOfObject:name];
        [categroy saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            NSLog(@"保存:%@,error:%@",name,error);
        }];
    }*/
    //初始化人群
    /*NSMutableArray *arr2 = [NSMutableArray array];
    [arr2 addObject:[[EFCrowd alloc]initWithJob:@"所有人群" sort:0]];
    [arr2 addObject:[[EFCrowd alloc]initWithJob:@"学生" sort:1]];
    [arr2 addObject:[[EFCrowd alloc]initWithJob:@"教师" sort:2]];
    [arr2 addObject:[[EFCrowd alloc]initWithJob:@"工人" sort:3]];
    [arr2 addObject:[[EFCrowd alloc]initWithJob:@"家庭主妇" sort:4]];
    [arr2 addObject:[[EFCrowd alloc]initWithJob:@"所有男士" sort:5]];
    [arr2 addObject:[[EFCrowd alloc]initWithJob:@"所有女士" sort:6]];
    [arr2 addObject:[[EFCrowd alloc]initWithJob:@"公务员" sort:7]];
    [AVObject saveAllInBackground:arr2 block:^(BOOL succeeded, NSError *error) {
        NSLog(@"保存人群基本信息：%d",succeeded);
    }];*/
    //初始化城市
    /*NSMutableArray *arr3 = [NSMutableArray array];
    [arr3 addObject:[[EFCity alloc] initWithProName:@"全国" cityName:@"全国" sort:0]];
    [arr3 addObject:[[EFCity alloc] initWithProName:@"全国" cityName:@"北京市" sort:1001]];
    [arr3 addObject:[[EFCity alloc] initWithProName:@"全国" cityName:@"上海市" sort:1002]];
    [arr3 addObject:[[EFCity alloc] initWithProName:@"山东省" cityName:@"德州市" sort:2001]];
    [arr3 addObject:[[EFCity alloc] initWithProName:@"山东省" cityName:@"济南市" sort:2002]];
    [AVObject saveAllInBackground:arr3 block:^(BOOL succeeded, NSError *error) {
        NSLog(@"保存城市基本信息：%d",succeeded);
    }];*/
    
    

}

@end
