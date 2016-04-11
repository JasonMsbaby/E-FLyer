//
//  List3TableViewCell.h
//  House_Project
//
//  Created by lanou3g on 14-10-13.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HouseListModelTwo.h"
@interface List3TableViewCell : UITableViewCell


@property(nonatomic,retain)UILabel * titleLabel;
@property(nonatomic,retain)UIImageView * leftImageView;


@property(nonatomic,retain)UIImageView * middleImageView;
@property(nonatomic,retain)UIImageView * rightImageView;

@property(nonatomic,retain)HouseListModelTwo * houseListModelTwo;




@end
