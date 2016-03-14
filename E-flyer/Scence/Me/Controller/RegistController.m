//
//  RegistController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/3/8.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "RegistController.h"

@interface RegistController ()
@property (weak, nonatomic) IBOutlet UIButton *btn_valid;
@property (weak, nonatomic) IBOutlet UIButton *btn_regist;

@end

@implementation RegistController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}


- (void)setupView{
    [_btn_valid setBackgroundColor:[UIColor colorWithWhite:0.600 alpha:1.000]];
    [_btn_regist setBackgroundColor:[UIColor colorWithRed:0.000 green:0.502 blue:0.251 alpha:1.000]];
    _btn_regist.layer.cornerRadius = 3;
    _btn_regist.clipsToBounds = YES;
}

/*!
 *  后退
 *
 *  @param sender
 */
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
