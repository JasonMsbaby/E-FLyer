//
//  LMCityLIstTableViewController.m
//  HouseProject
//
//  Created by lanou3g on 14-11-5.
//  Copyright (c) 2014年 liman. All rights reserved.
//

#import "LMCityLIstTableViewController.h"
#import "HousePriceTrendViewController.h"

@interface LMCityLIstTableViewController ()

@end

@implementation LMCityLIstTableViewController
- (void)dealloc
{
    [_cityListDictionary release];
    [_cityArray release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization

        //返回房价走势界面
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"comm_icon_close.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
        //设置leftBarButtonItem的颜色
         self.navigationItem.leftBarButtonItem.tintColor = [UIColor grayColor];
        //初始化字典和数组
        if (self.cityListDictionary == nil) {
            NSMutableDictionary *dic  = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@[@"北京",@"保定"],@"B",@[@"长春"],@"C",@[@"大连"],@"D",@[@"哈尔滨",@"邯郸",@"呼和浩特"],@"H",@[@"济南",@"吉林"],@"J",@[@"兰州",@"廊坊",@"洛阳"],@"L",@[@"青岛",@"秦皇岛"],@"Q",@[@"石家庄",@"沈阳"],@"S",@[@"天津",@"太原",@"泰州",@"唐山"],@"T",@[@"威海",@"潍坊"],@"W", @[@"西安"],@"X",@[@"烟台",@"银川"],@"Y",@[@"郑州",@"淄博"],@"Z",nil];
            self.cityListDictionary = dic;
            [dic release];
        }
        if (self.cityArray == nil) {
            NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:@"B",@"C",@"D",@"H", @"J",@"L",@"Q",@"S",@"T",@"W",@"X",@"Y",@"Z",nil];
            self.cityArray = array;
            [array release];
        }
    }
    return self;
}
//返回上一界面
- (void)back
{
    HousePriceTrendViewController *housePriceVC = [[HousePriceTrendViewController alloc]init];
    [self.navigationController popViewControllerAnimated:YES];
    [housePriceVC release];

   // [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"切换城市";
    // 刷新表格
    [self.tableView reloadData];
    

    
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
//分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cityArray.count;
}
//row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
        NSString *key = [_cityArray objectAtIndex:section];
        NSArray *contacts = [_cityListDictionary objectForKey:key];
        return contacts.count;
    
}
//header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   
    return  [_cityArray objectAtIndex:section];
    
}
//索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _cityArray;
}
//生成cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"city"];
    if (cell== nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"city"]autorelease];
    }
        NSString *key = [_cityArray objectAtIndex:indexPath.section];
        NSArray *array = [_cityListDictionary valueForKey:key];
        cell.textLabel.text = [array objectAtIndex:indexPath.row];
    
    // Configure the cell...
    
    return cell;
}
//cell选中时
//被选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = [_cityArray objectAtIndex:indexPath.section];
    NSArray *array = [_cityListDictionary valueForKey:key];
    NSString *text = [array objectAtIndex:indexPath.row];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:text forKey:@"cityName"];
    [user synchronize];
    HousePriceTrendViewController *housePriceVC = [[HousePriceTrendViewController alloc]init];
    [self.navigationController popViewControllerAnimated:YES];
    [housePriceVC release];
    //[self dismissViewControllerAnimated:YES completion:nil];
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
