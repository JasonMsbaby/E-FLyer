//
//  HistoryTableViewController.h
//  House_Project
//
//  Created by lanou3g on 14-10-21.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryTableViewController : UITableViewController<UIAlertViewDelegate>

//结果数组
@property (nonatomic,retain)NSMutableArray *resultArray;
//信息数组
@property (nonatomic,retain)NSMutableArray *inforArray;
/**/
@end
