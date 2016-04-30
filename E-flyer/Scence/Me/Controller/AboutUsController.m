//
//  AboutUsController.m
//  E-flyer
//  关于我们
//  Created by 张杰 on 16/4/30.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "UIView+EFView.h"
#import "UIImageView+EFImageView.h"
#import "AboutUsController.h"

@interface AboutUsController ()
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation AboutUsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.img setCornerRadius:self.img.width/2];
    self.title = @"关于我们";
}

@end
