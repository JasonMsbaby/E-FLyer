//
//  ViewControllerTwo.m
//  House_Project
//
//  Created by lanou3g on 14-11-13.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "ViewControllerTwo.h"

@interface ViewControllerTwo ()

@end

@implementation ViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"版本信息";
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView * imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"version.png"]];
    imageview.frame = CGRectMake(84, 30, 152, 152);
    [self.view addSubview:imageview];
    [imageview release];
    //标题
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(60, [[UIScreen mainScreen]bounds].size.height-135, 200, 20)];
    label.text = @"版本信息： V-2.01";
    label.font = [UIFont fontWithName:@"Zapfino" size:14];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    [label release];
    UILabel *briefLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, [[UIScreen mainScreen]bounds].size.height-175, 152, 40)];
    briefLabel.text = @"我们一直在努力！";
    briefLabel.textAlignment = NSTextAlignmentCenter;
    briefLabel.font = [UIFont fontWithName:@"Zapfino" size:12];
    briefLabel.textColor = [UIColor blackColor];
    [self.view addSubview:briefLabel];
    [briefLabel release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
