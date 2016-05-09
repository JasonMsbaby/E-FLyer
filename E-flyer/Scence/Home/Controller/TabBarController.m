//
//  TabBarController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/26.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "TabBarController.h"
#import "EFTabBar.h"
#import "HomeAddInfoController.h"
/**
 *  自定义底部导航栏
 */
@interface TabBarController ()
@property(strong,nonatomic) UIButton *addButton;
@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTabbar];
}
//重新加载tabbar
- (void)reloadTabbar:(NSNotification *)notification{
    if ([notification.name isEqualToString:@"reloadTabbar"]) {
        [self.tabBar layoutSubviews];
    }
}

- (void)loadTabbar{
    EFTabBar *tabbar = [[EFTabBar alloc]initWithFrame:self.tabBar.frame];
    [self setValue:tabbar forKey:@"tabBar"];
    self.selectedIndex= 0;
    [tabbar.addButton addTarget:self action:@selector(addInfo:) forControlEvents:(UIControlEventTouchUpInside)];
    //添加通知  用户用户角色改变时重新布局tabbar
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(reloadTabbar:) name:@"reloadTabbar" object:nil];
}



#pragma mark - 中间的按钮点击事件
- (void)addInfo:(UIButton *)sender{
    UINavigationController *addInfoControllerNav = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeAddInfoControllerNav"];
    [self presentViewController:addInfoControllerNav animated:YES completion:nil];
}






@end
