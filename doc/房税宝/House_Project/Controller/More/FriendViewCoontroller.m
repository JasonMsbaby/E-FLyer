//
//  FriendViewCoontroller.m
//  House_Project
//
//  Created by lanou3g on 14-10-17.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "FriendViewCoontroller.h"

@interface FriendViewCoontroller ()

@end


@implementation FriendViewCoontroller


-(void)dealloc
{
    [_str release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"友情链接";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIWebView * webview = [[UIWebView alloc] initWithFrame: CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:webview];
    [webview release];
    
    NSString * urlStr = self.str;
    NSURL * url = [NSURL URLWithString:urlStr];
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:url];
    [webview loadRequest:request];
    [request release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
