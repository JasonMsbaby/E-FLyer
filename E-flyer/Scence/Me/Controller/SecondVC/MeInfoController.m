//
//  MeInfoController.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/17.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "MeInfoModel.h"
#import "MeInfoController.h"
#import "PopView.h"
#import "PassWordChangeController.h"
#import "PhoneChangeController.h"
#import "ImageChangeController.h"
#import "EYInputPopupView.h"
@interface MeInfoController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSArray<MeInfoModel *> *dataSource;
@end

@implementation MeInfoController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = self.menu.title;
    self.dataSource = [[MeInfoModel sharedInstance].source objectForKey:self.menu.idd];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTableView];
}
- (void)loadTableView{
    self.navigationController.navigationBarHidden = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UIView *bottom = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView setTableFooterView:bottom];
}


#pragma mark - tableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell"];
    }
    MeInfoModel *model = self.dataSource[indexPath.section];
    cell.imageView.image = [UIImage imageNamed:model.img];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.content;
    if (model.haveNext) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MeInfoModel *model = self.dataSource[indexPath.section];
    if ([model.idd isEqualToString:@"password"]) {//修改密码
        PassWordChangeController *pwdVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PassWordChangeController"];
        pwdVC.title = @"修改密码";
        [self.navigationController pushViewController:pwdVC animated:YES];
        
    }else if ([model.idd isEqualToString:@"barImg"]){//修改店铺图片
        ImageChangeController *imgVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageChangeController"];
        imgVC.title = @"修改店铺图片";
        [self.navigationController pushViewController:imgVC animated:YES];
        
    }else if ([model.idd isEqualToString:@"phone"]){
        PhoneChangeController *phoneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhoneChangeController"];
        phoneVC.title = @"修改手机号";
        [self.navigationController pushViewController:phoneVC animated:YES];
        
    }
    else{
        int type = EYInputPopupView_Type_single_line_text;
        if ([model.idd isEqualToString:@"barInfo"]) {
            type = EYInputPopupView_Type_multi_line;
        }
        [EYInputPopupView popViewWithTitle:model.title contentText:model.content type:(type) cancelBlock:nil confirmBlock:^(UIView *view, NSString *text) {
            [self.currentUser setValue:text forKey:model.idd];
            [SVProgressHUD showWithStatus:@"正在保存..."];
            [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    [SVProgressHUD showSuccessWithStatus:@"更新数据成功"];
                    model.content = text;
                    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationAutomatic)];
                }else{
                    [self toastWithError:error];
                }
            }];
        } dismissBlock:nil];
    }
    
}



@end
