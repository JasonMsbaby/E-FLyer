//
//  DetailInfoTableViewController.m
//  House_Project
//
//  Created by lanou3g on 14-10-13.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "DetailInfoTableViewController.h"
#import "DetailInfoTableViewCell.h"
#import "HttpUrl.h"

@interface DetailInfoTableViewController ()

@end

@implementation DetailInfoTableViewController

-(void)dealloc
{
    [_docid release];
    [_str release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    JSONData *jsonData = [[JSONData alloc]init];
    jsonData.delegateHouseInfor = self;
    NSString *urlStr = [HttpUrl houseListInformationURLWith:self.docid];
    [jsonData houseInforMationJsonDataWithUrl:urlStr andDocid:self.docid];
    [jsonData release];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)jsonHouseInformationDataDidFinishLoad:(NSString *)str
{
    self.str = [NSMutableString stringWithString:str];
    [self.tableView reloadData];
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
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return [UIScreen mainScreen].bounds.size.height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    DetailInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dd"];
    if (cell == nil) {
        cell = [[[DetailInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"dd"]autorelease];
       
        cell.webView.frame = CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height-100);

    }
   ////////////////////
    NSString * startStr = @"<font";
    NSRange range= [self.str rangeOfString:startStr];
    if (range.location<200000) {
        NSString *string2 = [self.str substringToIndex:range.location];
        [cell.webView loadHTMLString:string2 baseURL:nil];
    }
    else
    {
        [cell.webView loadHTMLString:self.str baseURL:nil];
    }
    /////////////////////////
    return cell;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    
//    return 100;
//}


//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView * view = [[UIView alloc]init];
//    view.backgroundColor = [UIColor clearColor];
//    return view;
//    
//}

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
