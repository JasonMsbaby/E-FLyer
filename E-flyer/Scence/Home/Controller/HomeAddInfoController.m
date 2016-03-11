//
//  HomeAddInfoController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "HomeAddInfoController.h"
#import "SVProgressHUD.h"

@interface HomeAddInfoController ()


@end


@implementation HomeAddInfoController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"down_close"] style:(UIBarButtonItemStyleDone) target:self action:@selector(leftBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"share"] style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBarButtonItemClick:)];
}


#pragma mark - 导航栏两侧按钮点击事件
- (void)leftBarButtonItemClick:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)rightBarButtonItemClick:(UIBarButtonItem *)sender{
    [SVProgressHUD showInfoWithStatus:@"分享"];
}


@end
