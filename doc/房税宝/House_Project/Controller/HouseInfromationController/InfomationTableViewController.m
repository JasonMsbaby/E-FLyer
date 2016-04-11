//
//  InfomationTableViewController.m
//  House_Project
//
//  Created by lanou3g on 14-10-13.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "InfomationTableViewController.h"
#import "Header.h"
#import "List1TableViewCell.h"
#import "List2TableViewCell.h"
#import "HouseLIstTopModel.h"
#import "HouseListModel.h"
#import "HouseListModelTwo.h"
#import "List3TableViewCell.h"
#import "DetailInfoTableViewController.h"
#import "ThreeDeitailViewController.h"
#import "MJRefresh.h"

@interface InfomationTableViewController ()

@end

@implementation InfomationTableViewController

-(void)dealloc
{
    [_array release];
    [_dic release];
    [_myimageview release];
    [super dealloc];
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _array = [[NSMutableArray alloc]init];
        _dic = [[NSMutableDictionary alloc]init];
       
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //后台执行加载数据
    [self performSelectorInBackground:@selector(jiexi) withObject:nil];
    //占位图
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height-60)] ;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    imgView.backgroundColor = [UIColor whiteColor];
    imgView.image = [UIImage imageNamed:@"10.png"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(110, 100, 100, 30)];
    label.text = @"正在加载中...";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:17];
    label.textAlignment = NSTextAlignmentCenter;;
    [imgView addSubview:label];
    [label release];
    self.myimageview = imgView;
    [self.view addSubview:imgView];
    [imgView release];
    

}
-(void)jiexi
{
    //////////////////////////////
    [self setupRefresh];


}


- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    //#warning 自动刷新(一进入程序就下拉刷新)
    [self.tableView headerBeginRefreshing];
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    self.tableView.headerPullToRefreshText = @"下拉可以刷新了";
    self.tableView.headerReleaseToRefreshText = @"松开马上刷新了";
    self.tableView.headerRefreshingText = @"正在帮你刷新中、、、";
    
    self.tableView.footerPullToRefreshText = @"上拉可以加载更多数据了";
    self.tableView.footerReleaseToRefreshText = @"松开马上加载更多数据了";
    self.tableView.footerRefreshingText = @"正在帮你加载中、、、";
}
#pragma mark 开始进入刷新状态
- (void)headerRereshing
{
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //使用封装的类进行请求
        JSONData *jsonData = [[JSONData alloc]init];//
        jsonData.delegate = self;//
        [jsonData houseListJsonDataWithUrl:HousList_URL_ONE];//
        [jsonData release];//

        // 刷新表格
        [self.tableView reloadData];
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView headerEndRefreshing];
    });
}


- (void)footerRereshing
{
    JSONData *jsonData = [[JSONData alloc]init];
    jsonData.delegate = self;
    
    static int num = 20;
    if (num>101) {
        UIAlertView * alt = [[UIAlertView alloc]initWithTitle:@"提示" message:@"已到最后一页喽" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alt show];
        [alt release];
        [self.tableView footerEndRefreshing];
        return;
    }
    NSString * urlStr1 = @"http://c.m.163.com/nc/article/house/%E5%85%A8%E5%9B%BD/";
    NSString * urlStr2 = @"-20.html";
    NSString * str = [NSString stringWithFormat:@"%@%d%@",urlStr1,num,urlStr2];
    
    [jsonData houseListJsonDataWithUrl:str];
    
    num = num+20;
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView footerEndRefreshing];
    });
}


////////刘超龙

#warning mark ---  房市咨询页面的网络数据请求（可能出现空数据）
//实现代理方法
- (void)jsonDataDidFinishLoad:(NSMutableArray *)array
{
    NSLog(@"打印数据：%@",array);
    [self.myimageview removeFromSuperview];
    [self.array addObjectsFromArray:array];
    //重新加载数据
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

    return self.array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //三个cell类型分别进行判断
    NSDictionary * dic =[self.array objectAtIndex:indexPath.row];
    if (indexPath.row ==0) {
        List1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test" ];
        if (cell == nil) {
            cell = [[[List1TableViewCell alloc]init]autorelease];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        HouseLIstTopModel * houselistTopmodel = [[HouseLIstTopModel alloc]init];
        NSDictionary * dic =  [self.array objectAtIndex:0];
        [houselistTopmodel setValuesForKeysWithDictionary:dic];
        cell.houseListTopModel = houselistTopmodel;
        [houselistTopmodel release];
        return cell;
        
    }else{
        
        if (![dic.allKeys containsObject:@"imgextra"]){
            List2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test2" ];
            if (cell == nil) {
                cell = [[[List2TableViewCell alloc]init]autorelease];
            }
            HouseListModel * houseListModel = [[HouseListModel alloc]init];
            NSDictionary * dic = [self.array objectAtIndex:indexPath.row];
            [houseListModel setValuesForKeysWithDictionary:dic];
            
            cell.houseListModel = houseListModel;
            [houseListModel release];
            return  cell;
            
        }else
        {
            List3TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test3" ];
            if (cell == nil) {
                cell = [[[List3TableViewCell alloc]init]autorelease];
            }
            
            HouseListModelTwo * houselistModeltwo = [[HouseListModelTwo alloc]init];
            NSDictionary * dic = [self.array objectAtIndex:indexPath.row];
            NSString * middleImageViewStr = [[[dic objectForKey:@"imgextra"]objectAtIndex:0] valueForKey:@"imgsrc"];
            houselistModeltwo.middleImageViewStr = middleImageViewStr;
            
            NSString * rightImageViewStr = [[[dic objectForKey:@"imgextra"]objectAtIndex:1] valueForKey:@"imgsrc"];
            houselistModeltwo.rightImageViewStr = rightImageViewStr;
            [houselistModeltwo setValuesForKeysWithDictionary:dic];
            
            cell.houseListModelTwo = houselistModeltwo;
            
            [houselistModeltwo release];
            return  cell;
        }
    }


}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //三个cell类型分别进行判断
    NSDictionary * dic =[self.array objectAtIndex:indexPath.row];
    if (indexPath.row ==0) {
        return 220;
    }else{
    
    
    if ([dic.allKeys containsObject:@"imgextra"]){
        return 125;
        
    }else
    {
        return 80;;
    }
    }
}
-(void)cancel:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //三个cell类型分别进行判断
    if (indexPath.row==0) {
        return;
    }
    
    
    
    
    NSMutableDictionary * dic = [self.array objectAtIndex:indexPath.row];

        
        
    if ([dic.allKeys containsObject:@"imgextra"]){
        
        HouseListModelTwo * houselistModeltwo = [[HouseListModelTwo alloc]init];
        NSDictionary * dic = [self.array objectAtIndex:indexPath.row];
        NSString * middleImageViewStr = [[[dic objectForKey:@"imgextra"]objectAtIndex:0] valueForKey:@"imgsrc"];
        houselistModeltwo.middleImageViewStr = middleImageViewStr;
        
        NSString * rightImageViewStr = [[[dic objectForKey:@"imgextra"]objectAtIndex:1] valueForKey:@"imgsrc"];
        houselistModeltwo.rightImageViewStr = rightImageViewStr;
   
        NSString * leftImageViewStr = [dic objectForKey:@"imgsrc"];

        houselistModeltwo.imgsrc = leftImageViewStr;
        
        ThreeDeitailViewController * threeDetailVC = [[ThreeDeitailViewController alloc]init];
        threeDetailVC.houseListModelTwo = houselistModeltwo;
        [self.navigationController pushViewController:threeDetailVC animated:YES];
        [threeDetailVC release];
        [houselistModeltwo release];
        
    }else
    {
        NSString * docid = [dic objectForKey:@"docid"];
       
        DetailInfoTableViewController * detailViewController = [[DetailInfoTableViewController alloc]init];
        UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
        lable.backgroundColor = [UIColor clearColor];
        lable.font = [UIFont systemFontOfSize:14];
        lable.textColor = [UIColor grayColor];
        detailViewController.navigationItem.titleView = lable;
        lable.text = [dic objectForKey:@"title"];
        
        detailViewController.docid = docid;
        
        [self.navigationController pushViewController:detailViewController animated:YES];
        [detailViewController release];
        [lable release];
       
    }
    
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
