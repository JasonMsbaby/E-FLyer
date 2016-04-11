//
//  MoreTableViewController.m
//  House_Project
//
//  Created by 李超峰 on 14-10-24.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import "MoreTableViewController.h"
#import "ViewController1.h"
#import "FriendViewCoontroller.h"
#import "SMTPSenderViewController.h"
#import "ViewControllerTwo.h"



#import "SDImageCache.h"
@interface MoreTableViewController ()

@end

@implementation MoreTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title =@"更多";
        self.tableView.backgroundColor =[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor grayColor];
    //self.tableView.userInteractionEnabled = NO;
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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 1)
    {
        return 4;
    }
    if (section == 2) {
        return 2;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"morecell"];

    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"morecell"]autorelease];
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"关于我们";
                cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.font = [UIFont systemFontOfSize:14];
            }
            if (indexPath.row ==1) {
                
                cell.textLabel.text =@"版本信息";
                cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.font = [UIFont systemFontOfSize:14];
                
            }if (indexPath.row ==2) {
                
                cell.textLabel.text =@"意见反馈";
                cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.font = [UIFont systemFontOfSize:14];
            }if (indexPath.row ==3) {
                
                cell.textLabel.text =@"清除缓存";
                cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.font = [UIFont systemFontOfSize:14];
            }
            
        }
        if (indexPath.section ==2) {
            if (indexPath.row == 0) {
                UIImageView * image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"0"]];
                image.frame =CGRectMake(10, 7, 30, 30);
                [cell addSubview:image];
                
                UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(50, 7, 100, 30)];
                label.font = [UIFont systemFontOfSize:14];
                label.text = @"安居客";
                [cell addSubview:label];
                [label release];
                
                cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.font = [UIFont systemFontOfSize:14];
                    [image release];
            }
            else{
                cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.font = [UIFont systemFontOfSize:14];
                UIImageView * image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
                image.frame =CGRectMake(10, 7, 30, 30);
                [cell addSubview:image];
                [image release];
                
                UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(50, 7, 100, 30)];
                label.font = [UIFont systemFontOfSize:14];
                label.text = @"赶集生活";
                [cell addSubview:label];
                [label release];
            }
        }
        
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 33;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 33;
    }
    if (section == 3) {
        return 250;
    }
    return 0;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        UIView * view = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 33)]autorelease];
        view.backgroundColor =[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 13)];
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:12];
        label.text = @"友情链接";
        [view addSubview:label];
        [label release];
        return view;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            ViewController1 * vc1 = [[ViewController1 alloc]init];
            [self.navigationController pushViewController:vc1 animated:YES];
            [vc1 release];
        }if (indexPath.row == 1)
        {
           ViewControllerTwo * vc2 = [[ViewControllerTwo alloc]init];
            [self.navigationController pushViewController:vc2 animated:YES];
            [vc2 release];
        }
       if (indexPath.row == 2)
        {
            //意见反馈
            SMTPSenderViewController * EmailVC = [[SMTPSenderViewController alloc]init];
            UINavigationController *ngc = [[UINavigationController alloc]initWithRootViewController:EmailVC];
            [self presentViewController:ngc animated:YES completion:nil];
            [EmailVC release];
            [ngc release];
        }
        if (indexPath.row == 3) {
            //清除缓存
            //计算getsize
            int size = [[SDImageCache sharedImageCache]getSize];
            NSString *str = [NSString stringWithFormat:@"清除缓存：%dM",size/1024/1024];
            //提示
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:str delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            //清除
            [[SDImageCache sharedImageCache]clearDisk];
            [[SDImageCache sharedImageCache]clearMemory];
            [alertView release];
        }
                
        
        
    }
    if (indexPath.section ==2)
    {
        FriendViewCoontroller * friendVC = [[FriendViewCoontroller alloc]init];
        if (indexPath.row == 0)
        {
             friendVC.str = @"http://www.anjuke.com";
        }
        if (indexPath.row ==1) {
            friendVC.str = @"http://bj.ganji.com/fang/";
        }
        [self.navigationController pushViewController:friendVC animated:YES];
        [friendVC release];
    }
}

@end
