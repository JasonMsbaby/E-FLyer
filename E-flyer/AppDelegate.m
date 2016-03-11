//
//  AppDelegate.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/26.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

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
    
    

}

@end
