//
//  ViewController1.m
//  House_Project
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

-(void)dealloc
{
    [super dealloc];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.navigationItem.title = @"关于我们";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView * imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Icon-our-76.png"]];
    imageview.frame = CGRectMake(84, 30, 152, 152);
    [self.view addSubview:imageview];
    [imageview release];
    //标题
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(84, 190, 152, 30)];
    label.text = @"房税宝";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor orangeColor];
    [self.view addSubview:label];
    [label release];
    UILabel *briefLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, [[UIScreen mainScreen]bounds].size.height-175, 152, 40)];
    briefLabel.text = @"房税好助手！";
    briefLabel.textAlignment = NSTextAlignmentCenter;
    briefLabel.font = [UIFont fontWithName:@"Zapfino" size:12];
    briefLabel.textColor = [UIColor blackColor];
    [self.view addSubview:briefLabel];
    [briefLabel release];
    
    UILabel * mail = [[UILabel alloc]initWithFrame:CGRectMake(60, [[UIScreen mainScreen]bounds].size.height-135, 200, 20)];
    mail.text = @"Email：517855944@qq.com";
    mail.textAlignment = NSTextAlignmentCenter;
    mail.font = [UIFont systemFontOfSize:14];
    mail.textColor = [UIColor blackColor];
    [self.view addSubview:mail];
    [mail release];
    
    

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
