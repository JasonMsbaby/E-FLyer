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
    EFTabBar *tabBar = [[EFTabBar alloc]initWithFrame:self.tabBar.frame];
    [self setValue:tabBar forKey:@"tabBar"];
    self.selectedIndex= 0;
    [tabBar.addButton addTarget:self action:@selector(addInfo:) forControlEvents:(UIControlEventTouchUpInside)];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


#pragma mark - 中间的按钮点击事件
- (void)addInfo:(UIButton *)sender{
    UINavigationController *addInfoControllerNav = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeAddInfoControllerNav"];
    [self presentViewController:addInfoControllerNav animated:YES completion:nil];
}






@end
