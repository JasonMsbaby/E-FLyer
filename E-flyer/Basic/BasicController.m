//
//  BasicController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/27.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "BasicController.h"

@interface BasicController ()

@end

@implementation BasicController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentUser = [EFUser currentUser];
    //NSLog(@"BasicViewController");
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"left_back"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]style:(UIBarButtonItemStylePlain) target:self action:@selector(leftBarButtonItemBack:)];
}

- (void)leftBarButtonItemBack:(UIBarButtonItem *)item{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
