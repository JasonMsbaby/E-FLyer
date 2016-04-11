//
//  HelpLoadTableViewController.m
//  House_Project
//
//  Created by lanou3g on 14-11-6.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "HelpLoadTableViewController.h"
#import "MainCell.h"
#import "AttachedCell.h"
#import "Util.h"
@interface HelpLoadTableViewController ()

@end

@implementation HelpLoadTableViewController
-(void)dealloc
{
    [_dataArray release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleBordered target:self action:@selector(back:)];
        self.navigationItem.leftBarButtonItem =left;
        [left release];

        
        self.navigationItem.title = @"房贷常识";
        NSDictionary *dic = @{@"Cell": @"MainCell",@"isAttached":@(NO),@"title":@"1.商业贷款"};
         NSDictionary *dicTwo = @{@"Cell": @"MainCell",@"isAttached":@(NO),@"title":@"2.公积金贷款"};
        NSArray * array = @[dic,dicTwo];
        if (self.dataArray == nil) {
            self.dataArray = [[[NSMutableArray alloc]init]autorelease];
        }
        self.dataArray = [NSMutableArray arrayWithArray:array];
            // Custom initialization
    }
    return self;
}
- (void)back:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //去除tableView底部多余cell的分隔线
    self.tableView.tableFooterView = [[[UIView alloc]init]autorelease];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor grayColor];
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
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //初始化的状态和cell被选中的状态
    if ([[self.dataArray[indexPath.row] objectForKey:@"Cell"] isEqualToString:@"MainCell"])
    {
        MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
        if (cell == nil) {
            cell = [[[MainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"]autorelease];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
        cell.titleLabel.text = [self.dataArray[indexPath.row] objectForKey:@"title"];
        return cell;
    }else if([[self.dataArray[indexPath.row] objectForKey:@"Cell"] isEqualToString:@"AttachedCell"]){
        AttachedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AttachedCell"];
        if (cell == nil) {
            cell = [[[AttachedCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AttachedCell"]autorelease];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        //根据点击的cell获得标识
        NSString *title = [self.dataArray[indexPath.row] objectForKey:@"title"];
        title = [title substringToIndex:1];
        NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1%@",title] ofType:@"txt"];
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        cell.label.text = content;
        cell.label.frame = [cell.label adjustFrameHeightToAdaptiveWithMaxHeight:1000];
        return cell;

    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *title = [self.dataArray[indexPath.row] objectForKey:@"title"];
    NSIndexPath *path = nil;
    if ([[self.dataArray[indexPath.row] objectForKey:@"Cell"] isEqualToString:@"MainCell"]) {
        path = [NSIndexPath indexPathForItem:(indexPath.row+1) inSection:indexPath.section];
    }else{
        path = indexPath;
    }
    //通过Bool值判断是打开附加的cell还是关闭
    if ([[self.dataArray[indexPath.row] objectForKey:@"isAttached"] boolValue]) {
        // 关闭附加cell
        NSDictionary * dic = @{@"Cell": @"MainCell",@"isAttached":@(NO),@"title":title};
        self.dataArray[(path.row-1)] = dic;
        [self.dataArray removeObjectAtIndex:path.row];
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[path]  withRowAnimation:UITableViewRowAnimationMiddle];
        [self.tableView endUpdates];
    }else{
        // 打开附加cell
        NSDictionary * dic = @{@"Cell": @"MainCell",@"isAttached":@(YES),@"title":title};
        self.dataArray[(path.row-1)] = dic;
        NSDictionary * addDic = @{@"Cell": @"AttachedCell",@"isAttached":@(YES),@"title":title};
        [self.dataArray insertObject:addDic atIndex:path.row];
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
        [self.tableView endUpdates];
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.dataArray[indexPath.row] objectForKey:@"Cell"] isEqualToString:@"MainCell"])
    {
        return 40;
    }else{
        //根据点击的cell获得标识
        NSString *title = [self.dataArray[indexPath.row] objectForKey:@"title"];
        title = [title substringToIndex:1];
        
        NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1%@",title] ofType:@"txt"];
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        CGRect rect = [content boundingRectWithSize:CGSizeMake(300, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
        return rect.size.height;    }
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
