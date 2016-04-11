//
//  ViewController2.m
//  House_Project
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UILabel * label= [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 280 ,100)];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines =5;
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 5;
    label.text = @"版本－1.01";
    
    
    UIImageView * imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iTunesArtwork.png"]];
    imageview.frame =CGRectMake(0, 50, 320, self.view.bounds.size.height);
    [self.view addSubview:imageview];
    [imageview release];
    [self.view addSubview:label];
    [label release];
    
    // Do any additional setup after loading the view.
}
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
