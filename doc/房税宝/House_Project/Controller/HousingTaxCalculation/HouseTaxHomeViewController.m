//
//  HouseTaxHomeViewController.m
//  House_Project
//
//  Created by lanou3g on 14-11-12.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HouseTaxHomeViewController.h"
#import "DVSwitch.h"
#import "HouseTaxCalculationViewHomeController.h"
#import "HouseLoadOneViewController.h"
#import "HouseLoadTwoViewController.h"
//弹出菜单
#import "HelpTableViewController.h"
#import "HelpLoadTableViewController.h"
#import "RootViewController.h"
#import "HistoryTableViewController.h"
#import "HouseLoadListTableViewController.h"
#import "HPFLoadListTableViewController.h"
@interface HouseTaxHomeViewController ()

@end

@implementation HouseTaxHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"房税计算";
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Nav_list"] style:UIBarButtonItemStyleBordered target:self action:@selector(unfold:)];
    self.navigationItem.leftBarButtonItem =left;
    [left release];
    // Do any additional setup after loading the view.
    DVSwitch * dvSwitch = [[DVSwitch alloc]initWithStringsArray:@[@"房税",@"商贷",@"公积金"]];
    dvSwitch.backgroundColor = [UIColor colorWithRed:247/255.0 green:156/255.0 blue:12/255.0 alpha:1];
    dvSwitch.labelTextColorInsideSlider = [UIColor orangeColor];
    dvSwitch.labelTextColorOutsideSlider = [UIColor whiteColor];
    dvSwitch.sliderColor = [UIColor whiteColor];
    dvSwitch.cornerRadius = 5.0;
    dvSwitch.frame = CGRectMake(150, 5, 170,40);
    self.navigationItem.titleView  = dvSwitch;
    //控制器1
    HouseTaxCalculationViewHomeController *firstVC = [[HouseTaxCalculationViewHomeController alloc]init];
    [self.view addSubview:firstVC.view];
    [self addChildViewController:firstVC];
    
    //控制器2
    HouseLoadOneViewController *loadOneVC = [[HouseLoadOneViewController alloc]init];
    //控制器3
    HouseLoadTwoViewController *loadTwoVC = [[HouseLoadTwoViewController alloc]init];
    //表头
    NSArray * array = [[NSArray alloc]initWithObjects:firstVC,loadOneVC,loadTwoVC,nil];
    NSArray *viewArray = [[NSArray alloc]initWithObjects:firstVC.view,loadOneVC.view,loadTwoVC.view,nil];

    [dvSwitch setPressedHandler:^(NSUInteger index) {
        //移除视图和控制器
        [[[self.view subviews] lastObject] removeFromSuperview];
        [[self.childViewControllers lastObject] removeFromParentViewController];
        //添加视图和控制器
        [self.view addSubview:[viewArray objectAtIndex:index]];
        [self addChildViewController:[array objectAtIndex:index]];
        
    }];
    [dvSwitch release];
    [firstVC release];
    [loadOneVC release];
    [loadTwoVC release];
    [array release];
    
}
- (void)unfold:(UIBarButtonItem *)sender
{

        //第二个
        NSInteger numberOfOptions = 6;
        NSArray *items = @[
                           [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"Tax1"] title:@"房税小贴士"],
                           [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"Tax2"] title:@"房贷小贴士"],
                           [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"Tax3"] title:@"房贷利率表"],
                           [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"Tax4"] title:@"房税计算历史"],
                           [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"Tax5"] title:@"商贷计算历史"],
                           [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"Tax6"] title:@"公积金计算历史"]
                           ];
        
        RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
        av.delegate = self;
        //    av.bounces = NO;
        [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
    
}
- (void)showGridWithPath {
    NSInteger numberOfOptions = 6;
    NSArray *items = @[
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"Tax1"] title:@"房税小贴士"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"Tax2"] title:@"房贷小贴士"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"Tax3"] title:@"房贷利率表"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"Tax4"] title:@"房税计算历史"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"Tax5"] title:@"商贷计算历史"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"Tax6"] title:@"公积金计算历史"]
                       ];
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}
#pragma mark - RNGridMenuDelegate
//点击事件
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex {
    if (itemIndex == 0) {
        HelpTableViewController *helpOneTC = [[HelpTableViewController alloc]init];
        UINavigationController * helpOneNav = [[UINavigationController alloc]initWithRootViewController:helpOneTC];
        helpOneNav.navigationBar.backgroundColor = [UIColor whiteColor];
        helpOneNav.navigationBar.translucent= NO;
        helpOneTC.navigationItem.title = @"房税小贴士";
        //设置pop回来时baibtnItem的颜色
        helpOneNav.navigationBar.tintColor = [UIColor darkGrayColor];
        [self presentViewController:helpOneNav animated:YES completion:^{
        }];
        [helpOneTC release];
        [helpOneNav release];
    }else if (itemIndex == 1){
        HelpLoadTableViewController *helpTwoTC = [[HelpLoadTableViewController alloc]init];
        UINavigationController * helpTwoNav = [[UINavigationController alloc]initWithRootViewController:helpTwoTC];
        helpTwoNav.navigationBar.backgroundColor = [UIColor whiteColor];
        helpTwoNav.navigationBar.translucent= NO;
        helpTwoTC.navigationItem.title = @"房贷小贴士";
        //设置pop回来时baibtnItem的颜色
        helpTwoNav.navigationBar.tintColor = [UIColor darkGrayColor];
        [self presentViewController:helpTwoNav animated:YES completion:^{
        }];
        [helpTwoTC release];
        [helpTwoNav release];
        
    }else if (itemIndex == 2){
        RootViewController *rootVC = [[RootViewController alloc]init];
        UINavigationController * rootNav = [[UINavigationController alloc]initWithRootViewController:rootVC];
        rootNav.navigationBar.backgroundColor = [UIColor whiteColor];
        rootNav.navigationBar.translucent= NO;
        rootVC.navigationItem.title = @"房税利率表";
        //设置pop回来时baibtnItem的颜色
        rootNav.navigationBar.tintColor = [UIColor darkGrayColor];
        [self presentViewController:rootNav animated:YES completion:^{
        }];
        [rootVC release];
        [rootNav release];
    }else if (itemIndex == 3){
        HistoryTableViewController *historyOneTC = [[HistoryTableViewController alloc]init];
        UINavigationController * historyOneNav = [[UINavigationController alloc]initWithRootViewController:historyOneTC];
        historyOneNav.navigationBar.backgroundColor = [UIColor whiteColor];
        historyOneNav.navigationBar.translucent= NO;
        historyOneTC.navigationItem.title = @"房税";
        //设置pop回来时baibtnItem的颜色
        historyOneNav.navigationBar.tintColor = [UIColor darkGrayColor];
        [self presentViewController:historyOneNav animated:YES completion:^{
        }];
         [historyOneTC release];
        [historyOneNav release];
        
        
        
        
        
        
        
        
    }else if (itemIndex == 4){
        
        HouseLoadListTableViewController *historyTwoTC = [[HouseLoadListTableViewController alloc]init];
        UINavigationController * historyTwoNav = [[UINavigationController alloc]initWithRootViewController:historyTwoTC];
        historyTwoNav.navigationBar.backgroundColor = [UIColor whiteColor];
        historyTwoNav.navigationBar.translucent= NO;
        historyTwoTC.navigationItem.title = @"商业贷款";
        //设置pop回来时baibtnItem的颜色
        historyTwoNav.navigationBar.tintColor = [UIColor darkGrayColor];
        [self presentViewController:historyTwoNav animated:YES completion:^{
        }];
        [historyTwoTC release];
        [historyTwoNav release];
        
    }else if (itemIndex == 5){
        HPFLoadListTableViewController *historyThreeTC = [[HPFLoadListTableViewController alloc]init];
        UINavigationController * historyThreeNav = [[UINavigationController alloc]initWithRootViewController:historyThreeTC];
        historyThreeNav.navigationBar.backgroundColor = [UIColor whiteColor];
        historyThreeNav.navigationBar.translucent= NO;
        historyThreeTC.navigationItem.title = @"公积金贷款";
        //设置pop回来时baibtnItem的颜色
        historyThreeNav.navigationBar.tintColor = [UIColor darkGrayColor];
        [self presentViewController:historyThreeNav animated:YES completion:^{
        }];
         [historyThreeTC release];
        [historyThreeNav release];
       
    }
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
