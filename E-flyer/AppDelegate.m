//
//  AppDelegate.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/26.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFReciveOrder.h"
#import "EFGood.h"
#import <SVProgressHUD.h>
#import "EFCity.h"
#import "EFCrowd.h"
#import <IQKeyboardManager.h>
#import "AppDelegate.h"
#import <AVOSCloud.h>
#import "EFUser.h"
#import "EFCategroy.h"
@interface AppDelegate ()<BMKLocationServiceDelegate>
@property(strong,nonatomic) BMKLocationService *locationServices;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self loadLeanCloud];
    [self initData];
    //初始化一些基本数据
    [self initMap];
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
    UIView *bottom = [[UIView alloc] initWithFrame:CGRectZero];
    [[UITableView appearance] setTableFooterView:bottom];
    
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeGradient)];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    
    dispatch_queue_t queue = dispatch_queue_create("queue.init", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        [[EFCrowd shareInstance] initFromRemote];
        [[EFCategroy shareInstance]initWithRemote];
    });
    
}

- (void)initMap{
    self.mapManger = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [self.mapManger start:@"KwEQcioHGhuh2LAV6mxTQpbR4Hi8LLf3"  generalDelegate:nil];
    if (!ret) {
        [SVProgressHUD showErrorWithStatus:@"地图初始化失败,请打开本软件的定位权限"];
    }else{
        self.locationServices = [[BMKLocationService alloc]init];
        self.locationServices.delegate = self;
        [self.locationServices startUserLocationService];
    }
}


#pragma mark - 地理位置更新回调
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
    if (userLocation.location != nil) {
        float lat = userLocation.location.coordinate.latitude;
        float lng = userLocation.location.coordinate.longitude;
        CGPoint location;
        location.x = lng;
        location.y = lat;
        [[NSUserDefaults standardUserDefaults] setObject:NSStringFromCGPoint(location) forKey:@"currentLocation"];
        EFUser *currentUser = [EFUser currentUser];
        if (currentUser != nil) {
            currentUser.lat = lat;
            currentUser.lng = lng;
//            currentUser.lat = 39.911192;
//            currentUser.lng = 116.460844;
//            [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                if (succeeded) {
//                    NSLog(@"上传位置成功");
//                }else{
//                    NSLog(@"上传位置失败,失败原因：%@",error);
//                }
//            }];
//            [self.locationServices stopUserLocationService];
        }
    }
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
