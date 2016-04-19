//
//  MeController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/28.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "GoodsMangerController.h"
#import "MeInfoController.h"
#import "EFUser.h"
#import "MeController.h"
#import "SearchController.h"
#import "MeMenu.h"
#import "LoginController.h"
@interface MeController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *Header;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *HeaderMask;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *HeaderH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *HeaderMaskH;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UIView *userInfoView;
@property(strong,nonatomic) UIView *loginView;
@property(strong,nonatomic) NSDictionary *data;
@property(strong,nonatomic) UIButton *btn_login;
@property(strong,nonatomic) NSArray *sortedKeys;
@end

@implementation MeController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self loadLoginButton];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self initView];
    [self layoutUserInfo];
}
/*!
 *  加载视图
 */
- (void)initView{
    self.navigationController.navigationBarHidden = YES;
    self.headImg.layer.cornerRadius = 50;
    self.headImg.clipsToBounds = YES;
    self.headImg.userInteractionEnabled = YES;
    [self.headImg addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(uploadHeadImage)]];
    
    _data = [MeMenu menuListWithUser:self.currentUser];
    self.sortedKeys = [_data.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    [self.tableView reloadData];
    
    if (self.currentUser == nil) {
        self.userInfoView.hidden = YES;
        self.loginView.hidden = NO;
    }else{
        self.userInfoView.hidden = NO;
        self.loginView.hidden = YES;
    }
}
/*!
 *  加载用户数据
 */
- (void)layoutUserInfo{
    self.userName.text = self.currentUser.username;
    self.phone.text = self.currentUser.mobilePhoneNumber;
    self.money.text = [NSString stringWithFormat:@"%.2lf",self.currentUser.money];
    if (self.currentUser == nil) {
        self.headImg.image = [UIImage imageNamed:@"head"];
    }else{
        //加载用户的头像
        [self.headImg sd_setImageWithURL:[NSURL URLWithString:self.currentUser.headImg.url] placeholderImage:[UIImage imageNamed:@"head_default"] completed:nil];
    }}
/*!
 *  加载登录按钮
 */
- (void)loadLoginButton{
    [self.view layoutIfNeeded];
    self.loginView = [UIView new];
    self.btn_login = [[UIButton alloc]initWithFrame:CGRectMake(0, 25, 100, 30)];
    [self.btn_login setTitle:@"登录/注册" forState:(UIControlStateNormal)];
    [self.btn_login setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.btn_login addTarget:self action:@selector(loginAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.loginView addSubview:self.btn_login];
    [self.HeaderMask addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImg.mas_right).offset(10);
        make.right.equalTo(self.view).offset(-20);
        make.top.bottom.equalTo(self.headImg);
    }];
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
/*!
 *  注销登录
 *
 *  @param item
 */
- (void)exit{
    [AVUser logOut];
    [self loginAction:nil];
}

#pragma mark - 上传头像
- (void)uploadHeadImage{
    UIImagePickerController *imgPicVC = [[UIImagePickerController alloc]init];
    imgPicVC.mediaTypes = @[@"public.image"];
    imgPicVC.allowsEditing = YES;
    imgPicVC.delegate = self;
    WeakObj(self)
    [self alerSheetWithTitle:@"选择头像" Message:@"选择方式" Buttons:@[@"图库选取",@"照相"] CallBack:^(NSInteger index) {
        if (index == 1) {
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                [SVProgressHUD showErrorWithStatus:@"您的手机不支持相机功能"];
                return ;
            }
            imgPicVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        }else{
            imgPicVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        [selfWeak presentViewController:imgPicVC animated:YES completion:nil];
    }];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    WeakObj(self)
    [self dismissViewControllerAnimated:YES completion:^{
        UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
        selfWeak.headImg.image = img;
        selfWeak.currentUser.headImg = [ToolUtils dataWithImage:img VideoPath:nil];
        AVFile *oldFile = selfWeak.currentUser.headImg;
        [selfWeak.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                if (oldFile != nil) {
                    [oldFile deleteInBackground];
                }
                //[SVProgressHUD showSuccessWithStatus:@"上传头像成功"];
            }else{
                [selfWeak toastWithError:error];
            }
        }];
    }];
}


#pragma mark - ScrollViewDelegate
/*!
 *  计算scrollView的滚动距离 改变顶部view的高度实现黏性headerView
 *
 *  @param scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat h = -scrollView.contentOffset.y;
    //    NSLog(@"%f",h);
    CGFloat alpha = 1 - h / 100;
    //    NSLog(@"透明度:%f",alpha);
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
    NSArray *arr = _data[self.sortedKeys[section]];
    return arr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sortedKeys.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"meCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"meCell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSArray *arr = _data[self.sortedKeys[indexPath.section]];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    MeMenu *menu = _data[self.sortedKeys[section]][row];
    if ([menu.idd isEqualToString:@"exit"]) {
        [self exit];
    }else if ([menu.idd isEqualToString:@"goodsInfo"]){
        GoodsMangerController *goodListVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GoodsMangerController"];
        goodListVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:goodListVC animated:YES];
    }else{
        MeInfoController *infoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MeInfoController"];
        infoVC.hidesBottomBarWhenPushed = YES;
        infoVC.menu = menu;
        [self.navigationController pushViewController:infoVC animated:YES];
    }
}
@end
