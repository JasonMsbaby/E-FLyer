//
//  TabBarController.m
//  tabtext
//
//  Created by lanou3g on 14-10-14.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import "TabBarController.h"
#import "InfomationTableViewController.h"
#import "HouseTaxCalculationViewHomeController.h"
#import "HousePriceTrendViewController.h"
#import "MoreTableViewController.h"
#import "HouseTaxHomeViewController.h"
@interface TabBarController ()

@end

@implementation TabBarController


-(void)dealloc
{
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        InfomationTableViewController * infoList = [[InfomationTableViewController alloc]init];
        UINavigationController * infoListnav = [[UINavigationController alloc]initWithRootViewController:infoList];
        //设置pop回来时baibtnItem的颜色
        infoListnav.navigationBar.tintColor = [UIColor darkGrayColor];
        infoListnav.navigationBar.backgroundColor = [UIColor whiteColor];
        infoListnav.navigationBar.translucent= NO;
         infoList.navigationItem.title = @"房市资讯";
        infoListnav.tabBarItem.title = @"房市资讯";
        infoListnav.tabBarItem.image = [UIImage imageNamed:@"newsss"];
        
       // 房产税费控制器
        HouseTaxHomeViewController * taxVC = [[HouseTaxHomeViewController alloc]init];
        UINavigationController * taxnav = [[UINavigationController alloc]initWithRootViewController:taxVC];
        taxnav.navigationBar.translucent= NO;
        taxnav.navigationBar.tintColor = [UIColor lightGrayColor];
        taxnav.tabBarItem.title = @"房产税费";
        taxnav.tabBarItem.image = [UIImage imageNamed:@"53-house"];
        
        //房价走势控制器
        HousePriceTrendViewController * thirdVC = [[HousePriceTrendViewController alloc]init];
        UINavigationController * thirdnav = [[UINavigationController alloc]initWithRootViewController:thirdVC];
        thirdnav.navigationBar.translucent = NO;
        thirdnav.navigationBar.tintColor = [UIColor darkGrayColor];
        thirdnav.tabBarItem.image = [UIImage imageNamed:@"16-line-chart"];
        thirdVC.navigationItem.title = @"房价走势";
        thirdnav.tabBarItem.title = @"房价走势";
        thirdnav.navigationBar.translucent= NO;
        
        //更多
        MoreTableViewController * moreVC = [[MoreTableViewController alloc]init];
        UINavigationController * morenav = [[UINavigationController alloc]initWithRootViewController:moreVC];
        moreVC.navigationItem.title = @"更多";
        morenav.tabBarItem.title = @"更多";
        morenav.navigationBar.tintColor = [UIColor darkGrayColor];
        morenav.tabBarItem.image = [UIImage imageNamed:@"more2"];
        morenav.navigationBar.translucent = NO;
        
        //导航控制器管理控制器
        self.viewControllers = @[taxnav,infoListnav,thirdnav,morenav];
        [moreVC release];
        [morenav release];
        [thirdVC release];
        [thirdnav release];
        [infoList release];
        [infoListnav release];
        [taxVC release];
        [taxnav release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithTitle:@"返回主页" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel:)];
    self.navigationItem.leftBarButtonItem =left;
    [left release];
    // Do any additional setup after loading the view.
}
-(void)cancel:(UIButton *)sender
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
