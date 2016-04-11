//
//  HotAreaViewController.m
//  HouseProject2
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 邢君莉. All rights reserved.
//

#import "HotAreaViewController.h"
#import "HouseHeader.h"
@interface HotAreaViewController ()

@end

@implementation HotAreaViewController
- (void)dealloc
{
    [_myimageview release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"热门区域";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self performSelectorInBackground:@selector(jiexi) withObject:nil];
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height-60)] ;
    imgView.backgroundColor = [UIColor whiteColor];
    imgView.image = [UIImage imageNamed:@"10.png"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(110, 100, 100, 30)];
    label.text = @"正在加载中...";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;;
    [imgView addSubview:label];
    [label release];
    self.myimageview = imgView;
    [self.view addSubview:imgView];
    [imgView release];

}
-(void)jiexi
{
    MyData * myData = [[MyData alloc]init];
    myData.delegateHotArea = self;
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *cityName =[user valueForKey:@"cityName"];
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CityInfor" ofType:@"plist"];
    //获取字典
    NSDictionary * cityDic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *cityArray = [cityDic valueForKey:@"cities"];
    for (NSDictionary *dic in cityArray) {
        if ([[dic valueForKey:@"cityName"]isEqualToString:cityName]) {
            NSString *sigHotArea = [dic valueForKey:@"sigHotArea"];
            NSString *urlHotArea = [dic valueForKey:@"urlHotArea"];
            if ([sigHotArea isEqualToString:@"0"]) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"此城市热门区域没有开通" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
                [alert release];
            }else{
            //解析plist文件，获取url和sig值
            [myData hotAreaDataWithUrlStr:urlHotArea WithSig:sigHotArea];
            }
            break;
        }
    }
    [myData release];
}

- (void)didFinishAnalysisHotAreaWithArray:(NSArray *)array
{
    
    [self.myimageview removeFromSuperview];
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-50)];
    scrollView.contentSize = CGSizeMake(ScreenWidth, ScreenHeight*1.5);
    [self.view addSubview:scrollView];
    HouseHotAreaView * houseHotAreaView = [[HouseHotAreaView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) andHotAreaArray:array];
    [scrollView addSubview:houseHotAreaView];
    [houseHotAreaView release];

     [scrollView release];
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
