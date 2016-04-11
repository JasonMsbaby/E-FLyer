//
//  List2TableViewCell.h
//  House_Project
//
//  Created by lanou3g on 14-10-13.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HouseListModel.h"
@interface List2TableViewCell : UITableViewCell

@property(nonatomic,retain)UIImageView * leftImageView;
@property(nonatomic,retain)UILabel * titleLable;
@property(nonatomic,retain)UILabel * digestLable;

@property(nonatomic,retain)HouseListModel * houseListModel;

@end
