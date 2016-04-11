//
//  InfomationTableViewController.h
//  House_Project
//
//  Created by lanou3g on 14-10-13.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONData.h"


@interface InfomationTableViewController : UITableViewController<JSONDataDelagate>


@property (nonatomic, retain)NSMutableArray *array;
@property (nonatomic, retain)NSMutableDictionary *dic;

@property(nonatomic,retain)UIImageView  * myimageview;






@end
