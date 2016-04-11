//
//  ThreeDeitailViewController.m
//  House_Project
//
//  Created by lanou3g on 14-10-15.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "ThreeDeitailViewController.h"
#import "UIImageView+WebCache.h"


@interface ThreeDeitailViewController ()

@end

@implementation ThreeDeitailViewController

-(void)dealloc
{
    [_scrollView release];
    [_pageControl release];
    [_houseListModelTwo release];
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
    
    self.view.backgroundColor = [UIColor blackColor];
    //滑动的ScrollView
    UIPageControl * pagecontrol = [[UIPageControl alloc]initWithFrame:CGRectMake(115, 335, 80, 20)];
    self.pageControl = pagecontrol;
    pagecontrol.numberOfPages =3;
    pagecontrol.pageIndicatorTintColor = [UIColor grayColor];
    pagecontrol.currentPageIndicatorTintColor = [UIColor whiteColor];
    [self.view addSubview:pagecontrol];
    [pagecontrol release];
    UIScrollView * scv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 72, 320, 235)];
    scv.delegate =self;
    self.scrollView =scv;
    scv.contentSize =CGSizeMake(960, 235);
    scv.pagingEnabled =YES;
    scv.backgroundColor = [UIColor blackColor];
    
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 235)];
    [imageview setImageWithURL:[NSURL URLWithString:self.houseListModelTwo.imgsrc]];
    [scv addSubview:imageview];
    
    
    [imageview release];
    
    UIImageView * imgv2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"t5.jpg"]];
     [imgv2 setImageWithURL:[NSURL URLWithString:self.houseListModelTwo.middleImageViewStr]];
    imgv2.frame =CGRectMake(320, 0, 320, 235);
    [scv addSubview:imgv2];
    [imgv2 release];
    
    UIImageView * imgv3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"t6.jpg"]];
    [imgv3 setImageWithURL:[NSURL URLWithString:self.houseListModelTwo.rightImageViewStr]];

    imgv3.frame =CGRectMake(640, 0, 320, 235);
    [scv addSubview:imgv3];
    [imgv3 release];
    

    
    
    [self.view addSubview:scv];
    [scv release];

    
    
    
    
    
    
    
    
    
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage =(int)(self.scrollView.contentOffset.x/320);
    
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
