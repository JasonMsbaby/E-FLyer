//
//  GuideViewController.m
//  House_Project
//
//  Created by lanou3g on 14-10-24.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "GuideViewController.h"
#import "TabBarController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController
-(void)dealloc
{
    [super dealloc];
}

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
    [super viewDidLoad];
    
    //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝图片数组＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    NSMutableArray *imagesArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"user_guide1"], [UIImage imageNamed:@"user_guide2"],[UIImage imageNamed:@"user_guide3"],nil];
    //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝创建UIScrollView对象＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    UIScrollView * scrollView=[[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.scrollView=scrollView;
    scrollView.layer.masksToBounds =YES;
    scrollView.layer.cornerRadius =5;
    scrollView.pagingEnabled=YES;
    scrollView.delegate=self;
    scrollView.contentSize=CGSizeMake([[UIScreen mainScreen] bounds].size.width*imagesArray.count, [[UIScreen mainScreen] bounds].size.height);
    //for循环添加图片
    for (int i=0; i<imagesArray.count; i++) {
        UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width*i, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds ].size.height)];
        imageView.image=[imagesArray objectAtIndex:i];
        imageView.layer.masksToBounds =YES;
        imageView.layer.cornerRadius =5;
        [scrollView addSubview:imageView];
        [imageView release];
    }
    //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝button＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"进去瞧瞧" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame =CGRectMake([[UIScreen mainScreen] bounds].size.width*3-200, [[UIScreen mainScreen] bounds].size.height-90, 90, 44);
    [button addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 5;
    [self.scrollView addSubview:button];
    //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝创建UIPageControl对象＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    UIPageControl * pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-190, [[UIScreen mainScreen]bounds].size.height-20, 60, 20)];
    pageControl.enabled=YES;
    self.pageControl=pageControl;
    pageControl.pageIndicatorTintColor = [UIColor orangeColor];
    pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.numberOfPages=imagesArray.count;
    [pageControl addTarget:self action:@selector(changePages:) forControlEvents:UIControlEventValueChanged];
    //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝添加视图＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    [self.view addSubview:scrollView];
    [self.view addSubview:pageControl];
     //＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝释放＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    [scrollView release];
    [pageControl release];

}
-(void)next:(id)sender
{
    
    TabBarController *houseTBC = [[TabBarController alloc]init];
    
    houseTBC.tabBar.translucent = NO;  //ios7
    houseTBC.tabBar.selectedImageTintColor = [UIColor colorWithRed:235/255.0 green:155/255.0 blue:0 alpha:1];
   
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    [self presentViewController:houseTBC animated:YES completion:nil];
    [houseTBC release];

}
- (void)changePages:(UIPageControl *)page
{
    [_scrollView setContentOffset:CGPointMake([page currentPage]*[[UIScreen mainScreen] bounds].size.width, 0) animated:YES];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int pages=scrollView.contentOffset.x/[[UIScreen mainScreen] bounds].size.width;
    _pageControl.currentPage=pages;
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
