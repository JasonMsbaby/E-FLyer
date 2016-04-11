//
//  MoreViewController.m
//  House_Project
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "MoreViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "FriendViewCoontroller.h"
#import "HouseHeader.h"
#import "MoreModelTextField.h"
#import "MoreModelTFOne.h"
@interface MoreViewController ()


@end

@implementation MoreViewController

static BOOL isOpen = NO;
-(void)dealloc
{
    [_rightBtn release];
    [_textView release];
    [_scrollView release];
    [_tableView release];
    [_titleArray release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.titleArray = [NSMutableArray arrayWithObjects:@"1.契费",@"2.个税",@"3.营业税",@"4.土地出让金",@"5.中介服务费",@"6.上市",@"7.贷款代办费",nil];

        UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithTitle:@"帮助" style:UIBarButtonItemStyleBordered target:self action:@selector(addTextView:)];
        self.navigationItem.rightBarButtonItem =right;
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor grayColor];
        self.rightBtn = right;
        [right release];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 430)];
    scrollView.contentSize= CGSizeMake(320, 480);
    scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
  
    NSArray *array = [[NSArray alloc]initWithObjects:@"关于我们",@"版本信息",@"安居客",@"赶集生活",nil];
    
    for (int i = 0; i < array.count-2; i++) {
        MoreModelTFOne *moreModelTF = [[MoreModelTFOne alloc]initWithFrame:CGRectMake(10, 20+40*i, 300, 40) andTitle:[array objectAtIndex:i]];
        [self.scrollView addSubview:moreModelTF];
       //按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10, 20+40*i, 300, 40);
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
        [moreModelTF release];
    }
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 300, 40)];
    label.text = @"友情链接";
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor grayColor];
    [self.scrollView addSubview:label];
    [label release];
    for (int j = 2; j < array.count; j++) {
        MoreModelTextField *moreModelTF = [[MoreModelTextField alloc]initWithFrame:CGRectMake(10, 140+60*(j-2), 300, 60)andImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",j-2]] andTitle:[array objectAtIndex:j]];
        [self.scrollView addSubview:moreModelTF];
        //按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10, 140+60*(j-2), 300, 60);
        btn.tag = j;
        [btn addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
        [moreModelTF release];
        
        
    }
    
    [array release];
    [scrollView release];

    
}
- (void)btnClick:(UIButton *)sender
{
    if (sender.tag == 0) {
        ViewController1 * vc1 = [[ViewController1 alloc]init];
        [self.navigationController pushViewController:vc1 animated:YES];
        [vc1 release];
    }else if (sender.tag == 1){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"版本信息" message:@"版本1.0.1" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        //版本信息
//        ViewController2 * vc2 = [[ViewController2 alloc]init];
//        [self.navigationController pushViewController:vc2 animated:YES];
//        [vc2 release];
    }
}
- (void)btnClick1:(UIButton *)sender
{
    FriendViewCoontroller * friendVC = [[FriendViewCoontroller alloc]init];
    if (sender.tag ==2) {
        friendVC.str = @"http://www.anjuke.com";
    }
    if (sender.tag ==3) {
        friendVC.str = @"http://bj.ganji.com/fang/";
    }
    [self.navigationController pushViewController:friendVC animated:YES];
    [friendVC release];
}
- (void)textDisappear:(UIBarButtonItem *)sender
{
    if (isOpen == YES) {
        isOpen = NO;
        [self.textView removeFromSuperview];
    }

    _scrollView.scrollEnabled = YES;
    [UIView beginAnimations:@"transition" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view.superview cache:YES];
    [_tableView removeFromSuperview];
    
    [UIView commitAnimations];

    self.navigationItem.rightBarButtonItem = _rightBtn;
}
- (void)addTextView:(UIBarButtonItem *)sender
{
    _scrollView.scrollEnabled = NO;
    UIBarButtonItem * btn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(textDisappear:)];
    self.navigationItem.rightBarButtonItem = btn;
    self.navigationItem.rightBarButtonItem.tintColor= [UIColor grayColor];
    
    
    [UIView beginAnimations:@"transition" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view.superview cache:YES];
    
    
 
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-39)];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    tableView.rowHeight = 50;
    
    //去除tableView底部多余cell的分隔线
    tableView.tableFooterView = [[[UIView alloc]init]autorelease];
    [UIView commitAnimations];
}


#pragma mark----UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"]autorelease];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}
#pragma mark----UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!isOpen) {
        
        [UIView beginAnimations:@"transition" context:nil];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view.superview cache:YES];
        
        NSString * str = [NSString stringWithFormat:@"%d.txt",indexPath.row+1];
        NSURL * url = [[NSBundle mainBundle] URLForResource:str withExtension:nil];
        NSMutableAttributedString * attributedTextHolder = [[NSMutableAttributedString alloc]initWithFileURL:url options:@{} documentAttributes:nil error:nil];
        
        [attributedTextHolder addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0,attributedTextHolder.length)];
        
        
        CGRect rect = [attributedTextHolder boundingRectWithSize:CGSizeMake(ScreenWidth, ScreenHeight) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        
        
        
        UITextView * textView = [[UITextView alloc]initWithFrame:CGRectMake(120, (indexPath.row+2)*50, ScreenWidth-120, 1.5*rect.size.height)];
        [self.view addSubview:textView];
        self.textView = textView;
        textView.editable = NO;
        textView.backgroundColor = [UIColor colorWithRed:250/255.0 green:196/255.0 blue:141/255.0 alpha:0.9 ];
        
        textView.center = CGPointMake(ScreenWidth/2+60, ScreenHeight/2);
        
        //圆角设置
        textView.layer.masksToBounds = YES;
        textView.layer.cornerRadius = 5;
        
        textView.contentSize = CGSizeMake(ScreenWidth-120, rect.size.height);
        
        tableView.scrollEnabled = NO;
        
        self.textView = textView;
        textView.attributedText = attributedTextHolder;
        [attributedTextHolder release];
        [textView release];
        isOpen = YES;
        
        [UIView commitAnimations];
    }else
    {
        isOpen = NO;
        [UIView beginAnimations:@"transition" context:nil];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view.superview cache:YES];
        [self.textView removeFromSuperview];
        [UIView commitAnimations];
    }
    
    
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
