//
//  MeController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/28.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFUser.h"
#import "MeController.h"
#import "SearchController.h"
#import "MeMenu.h"
#import "LoginController.h"
@interface MeController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *Header;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *HeaderMask;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *HeaderH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *HeaderMaskH;
@property (weak, nonatomic) IBOutlet UIView *headImg;
@property (weak, nonatomic) IBOutlet UIView *userInfoView;
@property(strong,nonatomic) NSDictionary *data;
@property(strong,nonatomic) UIButton *btn_login;
@end

@implementation MeController
-(void)viewDidLoad{
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self initView];
}
/*!
 *  加载视图
 */
- (void)initView{
    self.headImg.layer.cornerRadius = 50;
    self.headImg.clipsToBounds = YES;
    _data = [MeMenu menuList];
    if (self.currentUser == nil) {
        [self hiddenSubView:YES];
    }else{
        [self hiddenSubView:NO];
    }
}
/*!
 *  控制子控件的显示隐藏
 *
 *  @param flag
 */
- (void)hiddenSubView:(BOOL)flag{
    for (UIView *view in self.userInfoView.subviews) {
        view.hidden = flag;
    }
    if (flag) {
        [self loadLoginButton];
    }
}
/*!
 *  加载登录按钮
 */
- (void)loadLoginButton{
    self.btn_login = [[UIButton alloc]initWithFrame:CGRectMake(0, 25, 100, 30)];
    [self.btn_login setTitle:@"登录/注册" forState:(UIControlStateNormal)];
    [self.btn_login setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.btn_login addTarget:self action:@selector(loginAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.userInfoView addSubview:self.btn_login];
}
/*!
 *  点击登录按钮
 *
 *  @param sender
 */
- (void)loginAction:(UIButton *)sender{
    LoginController *loginController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginController"];
    loginController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:loginController animated:YES];
}


#pragma mark - ScrollViewDelegate
/*!
 *  计算scrollView的滚动距离 改变顶部view的高度实现黏性headerView
 *
 *  @param scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat h = -scrollView.contentOffset.y;
    NSLog(@"%f",h);
    CGFloat alpha = 1 - h / 100;
    NSLog(@"透明度:%f",alpha);
    //更改毛玻璃透明度
    if (h <= 0) {
        alpha = 1;
        h = 0;
    }
    self.HeaderMask.alpha = alpha;
    self.HeaderH.constant = h + 200;
    self.HeaderMaskH.constant = h + 200;
    
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = _data[_data.allKeys[section]];
    return arr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _data.allKeys.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"meCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"meCell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSArray  *arr = _data[_data.allKeys[indexPath.section]];
    MeMenu *menu = arr[indexPath.row];
    cell.textLabel.text = menu.title;
    cell.imageView.image = [UIImage imageNamed:menu.img];
    return  cell;
}
#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.00001;
    }
    return 0.1;
}
@end