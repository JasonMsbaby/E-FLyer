//
//  SearchController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/27.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "SearchController.h"

@interface SearchController ()


@end

@implementation SearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchTextField becomeFirstResponder];
}
- (IBAction)close:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];
}

@end
