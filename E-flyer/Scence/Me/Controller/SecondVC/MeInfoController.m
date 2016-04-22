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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MeInfoModel *model = self.dataSource[indexPath.section];
    [EYInputPopupView popViewWithTitle:model.title contentText:model.content type:(EYInputPopupView_Type_single_line_text) cancelBlock:nil confirmBlock:^(UIView *view, NSString *text) {
        NSLog(@"%@",text);
    } dismissBlock:nil];
}



@end
