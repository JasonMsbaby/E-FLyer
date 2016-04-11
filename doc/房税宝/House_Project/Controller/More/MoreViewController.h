//
//  MoreViewController.h
//  House_Project
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) UIBarButtonItem * rightBtn;
@property (nonatomic,retain) UITextView * textView;
@property (nonatomic,retain) UIScrollView * scrollView;

@property (nonatomic,retain) UITableView * tableView;
@property (nonatomic,retain) NSMutableArray * titleArray;


@end
