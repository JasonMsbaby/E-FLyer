//
//  HousePriceTrendViewController.m
//  HouseProject2
//
//  Created by lanou3g on 14-10-15.
//  Copyright (c) 2014年 邢君莉. All rights reserved.
//

#import "HousePriceTrendViewController.h"
#import "MyDataTools.h"
#import "HousePriceTrendView.h"
#import "HouseHeader.h"
#import "HotAreaViewController.h"
#import "LMCityLIstTableViewController.h"
@interface HousePriceTrendViewController ()

@end

@implementation HousePriceTrendViewController
static int i = 0;
- (void)dealloc
{
    [_myimageview release];
    [_activityIndicatorView release];
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
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if (i++ != 0) {
        [[[self.view subviews] lastObject] removeFromSuperview];
        [[[self.view subviews]firstObject]removeFromSuperview] ;
        [self viewDidLoad];
    }
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self performSelectorInBackground:@selector(jiexi) withObject:nil];
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height)] ;
    imgView.backgroundColor = [UIColor whiteColor];
    imgView.image = [UIImage imageNamed:@"9.png"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(110, 150, 100, 30)];
    label.text = @"正在加载,请稍后...";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;;
    [imgView addSubview:label];
    [label release];
    self.myimageview = imgView;
    //初始化:
    UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    self.activityIndicatorView= indicator;
    //设置显示样式,见UIActivityIndicatorViewStyle的定义
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    //设置显示位置
    [indicator setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2- 160)];
    //设置背景色
    indicator.backgroundColor = [UIColor clearColor];
    //设置背景为圆角矩形
    indicator.layer.cornerRadius = 6;
    indicator.layer.masksToBounds = YES;
    [indicator startAnimating];
    [self.myimageview addSubview:indicator];
    [self.view addSubview:imgView];
    [indicator release];
    [imgView release];
    

    // Do any additional setup after loading the view.
    
}
-(void)jiexi
{
    MyData * myData = [[MyData alloc]init];
    myData.delegateTrend = self;
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *cityName =[user valueForKey:@"cityName"];
    if (cityName == nil) {
        [user setValue:@"北京" forKey:@"cityName"];
        [user synchronize];
        cityName = @"北京";
    }
    // 获取文件路径
  
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CityInfor" ofType:@"plist"];
    //获取字典
    //解析plist文件，获取url和sig值
    NSDictionary * cityDic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *cityArray = [cityDic valueForKey:@"cities"];
    for (NSDictionary *dic in cityArray) {
        if ([[dic valueForKey:@"cityName"]isEqualToString:cityName]) {
            NSString *sig = [dic valueForKey:@"sig"];
            NSString *url = [dic valueForKey:@"url"];
            if ([sig isEqualToString:@"0"]) {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"此城市暂时开通" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
                [alert release];
            }else{
                [myData housePriceTrendDataWithUrlStr:url WithSig:sig];
            }
            break;
        }
    }

    [myData release];
}
- (void)didFinishAnalysisPriceTrenWithDic:(NSDictionary *)dic
{
    [self.activityIndicatorView stopAnimating];
    [self.myimageview removeFromSuperview];
    if (dic!= nil) {
        
        UIScrollView  * baseView = [[UIScrollView alloc]initWithFrame:CGRectMake(5, 5, ScreenWidth-10, ScreenHeight-20)];
        baseView.contentSize = CGSizeMake(ScreenWidth-10, ScreenHeight*1.1);
        [self.view addSubview:baseView];
        //上面界面
        HousePriceTrendView * housePriceTrendView = [[HousePriceTrendView alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth, ScreenHeight-84) andPriceDic:dic];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0,0, 120, 60);
        btn.backgroundColor = [UIColor clearColor];
        [btn addTarget:self action:@selector(selectCity:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 20, 10, 10)];
        imgView.image = [UIImage imageNamed:@"area_filter_unfold@2x.png"];
        [btn addSubview:imgView];
         NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSString *cityName = [user valueForKey:@"cityName"];
        //显示地点的Label
        UILabel * locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(18,10, 80, 30)];
        [btn addSubview:locationLabel];
        locationLabel.adjustsFontSizeToFitWidth = YES;
        if (cityName == nil) {
            locationLabel.text = @"北京";
        }else{
            locationLabel.text = cityName;
        }
        
        locationLabel.font = [UIFont systemFontOfSize:15];
        locationLabel.textColor = [UIColor whiteColor];
        
        [housePriceTrendView addSubview:btn];
        [baseView addSubview:housePriceTrendView];
        [imgView release];
        [locationLabel release];
        [housePriceTrendView release];
        
        //查看热门区域Button，点击跳转到HotAreaViewController页面
        UIButton * hotAreaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [hotAreaBtn setTitle:@"查看热门区域" forState:UIControlStateNormal];
        hotAreaBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [baseView addSubview:hotAreaBtn];
        hotAreaBtn.frame = CGRectMake(0, ScreenHeight-84, ScreenWidth, 30);
        hotAreaBtn.backgroundColor = [UIColor lightGrayColor];
        [hotAreaBtn addTarget:self action:@selector(hotAreaBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [baseView release];

    }
    }

- (void)selectCity:(UIButton *)sender
{
    
    LMCityLIstTableViewController *cityListVC = [[LMCityLIstTableViewController alloc]init];
    [self.navigationController pushViewController:cityListVC animated:YES];
    [cityListVC release];
}

- (void)hotAreaBtnClick:(UIButton *)sender
{
    HotAreaViewController * hotAreaVC = [[HotAreaViewController alloc ]init];
    [self.navigationController pushViewController:hotAreaVC animated:YES];
    [hotAreaVC release];
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
