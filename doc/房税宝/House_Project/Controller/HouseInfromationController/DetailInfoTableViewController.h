//
//  DetailInfoTableViewController.h
//  House_Project
//
//  Created by lanou3g on 14-10-13.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONData.h"
@interface DetailInfoTableViewController : UITableViewController<JSONHouseInformationDataDelagate>
@property (nonatomic , retain)NSString * docid;
@property (nonatomic, retain)NSMutableString *str;
@end
