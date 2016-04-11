//
//  RootViewController.m
//  DAY8_Test
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 liman. All rights reserved.
//

#import "RootViewController.h"
#import "TaxRateImageView.h"
@interface RootViewController ()

@end

@implementation RootViewController
- (void)dealloc
{
    [_baseScorllView release];
    [_taxView release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"贷款利率表";
        UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleBordered target:self action:@selector(back:)];
        self.navigationItem.leftBarButtonItem =left;
        [left release];
        UIBarButtonItem *imgBarBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"恢复" style:UIBarButtonItemStyleBordered target:self action:@selector(btnClick:)];
        self.navigationItem.rightBarButtonItem = imgBarBtnItem;
        [imgBarBtnItem release];
        
        }
    return self;
}
- (void)back:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *baseScorllView = [[UIScrollView alloc]initWithFrame:CGRectMake(5, 5, 310, 480)];
    baseScorllView.delegate = self;
    [self.view addSubview:baseScorllView];

    TaxRateImageView * taxView = [[TaxRateImageView alloc]initWithFrame:CGRectMake(0, 0, 310, 480)];
    taxView.imageView.image = [UIImage imageNamed:@"贷款3.jpg"];
    [baseScorllView addSubview:taxView];
    self.taxView = taxView;
    [taxView release];
    
}

- (void)btnClick:(UIButton *)sender
{
       _taxView.scrollView.zoomScale = 1;
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
