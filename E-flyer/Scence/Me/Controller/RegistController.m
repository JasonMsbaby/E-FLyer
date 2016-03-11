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

@end

@implementation RegistController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_btn_valid setBackgroundColor:[UIColor colorWithWhite:0.600 alpha:1.000]];
    
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
