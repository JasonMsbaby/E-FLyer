//
//  HPFLoadListTableViewController.m
//  House_Project
//
//  Created by lanou3g on 14-10-26.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HPFLoadListTableViewController.h"
#import "DBManger.h"
#import "HPFLoadModel.h"
#import "HistoryListTableViewCell.h"
#import "HPFLLoadResultInforTableViewController.h"
@interface HPFLoadListTableViewController ()

@end

@implementation HPFLoadListTableViewController
static int flag = 0;
- (void)dealloc
{
    [_array release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleBordered target:self action:@selector(back:)];
        self.navigationItem.leftBarButtonItem =left;
        [left release];
        //清除
        UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"delete.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(deleteAll:)];
        self.navigationItem.rightBarButtonItem = right;
        [right release];
    }
    return self;
}
- (void)back:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)deleteAll:(UIBarButtonItem *)sender
{
    NSMutableArray *arrayOne  = [DBManger selectHPFLInforAll];
    if (arrayOne.count == 0) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"还没有数据哦！" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        return;
    }
    //提示
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"是否清除全部数据" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消",nil];
    flag = 2;
    [alertView show];
    [alertView release];
}
//提示框的代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (flag == 2 && buttonIndex == 0) {
        //删除数据库的所有记录
        [DBManger deleteAllHPFLInfor];
        //将该对象从数组中移除
        [self.array removeAllObjects];
        //刷新数据
        [self.tableView reloadData];
    }
}


// 编辑按钮样式，让tableView处于被编辑的状态
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    //如果不调用父类的方法，则会一直处于编辑状态
    [super setEditing:editing animated:animated];
    //tableVIew切换编辑状态
    [self.tableView setEditing:editing animated:animated];
}
//指定那些行可以被编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//指定tableView的编辑样式(删除)
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
    
}
// 完成（先移除数据，后移除cell）
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取要删除的对象
    HPFLoadModel * HPFLModel = [self.array objectAtIndex:indexPath.row];
    //删除数据库对应的记录
    [DBManger deleteHPFLInforWhereIndex:HPFLModel];
    //将该对象从数组中移除
    [self.array removeObject:HPFLModel];
    //移除cell
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.array = [DBManger selectHPFLInforAll];
    //有数据时就有row
    self.tableView.tableFooterView = [[[UIView alloc]init]autorelease];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (self.array.count == 0) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(110, 100, 100, 120)];
        imgView.backgroundColor = [UIColor whiteColor];
        imgView.image = [UIImage imageNamed:@"收藏6.jpg"];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(110, 220, 100, 30)];
        label.text = @"还没有计算哦";
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;;
        [self.view addSubview:label];
        [label release];
        [self.view addSubview:imgView];
        [imgView release];
    }
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HistoryListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"historyListTVC"];
    if (cell == nil) {
        cell= [[[HistoryListTableViewCell alloc]init]autorelease];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    BusinessLoanModel * blModel = [self.array objectAtIndex:self.array.count-indexPath.row-1];
    cell.dateLabel.text = [NSString stringWithFormat:@"公积金贷款：%@",blModel.date];
    // Configure the cell...
    
    return  cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPFLoadModel * HPFLModel = [self.array objectAtIndex:self.array.count-indexPath.row-1];
    NSMutableArray *HPFLModelArray = [NSMutableArray arrayWithObjects:HPFLModel.marriage,HPFLModel.personal,HPFLModel.spouse,HPFLModel.assessValue,HPFLModel.houseArea,HPFLModel.percentage,HPFLModel.year,HPFLModel.APR,HPFLModel.APRValue,HPFLModel.monthMoney,HPFLModel.loadMoneyOne,HPFLModel.monthLoadMoneyOne,HPFLModel.loadMoneyTwo,HPFLModel.monthLoadMoneyTwo,HPFLModel.loadMoneyLast,HPFLModel.monthLoadMoneyLast,nil];
    //跳详细结果页面
    
    HPFLLoadResultInforTableViewController *loadInforTVC = [[HPFLLoadResultInforTableViewController alloc]init];
    loadInforTVC.HPFLarray = [NSMutableArray arrayWithArray:HPFLModelArray];
    [self.navigationController pushViewController:loadInforTVC animated:YES];
    [loadInforTVC release];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
