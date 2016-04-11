//
//  HouseLoadResultViewController.h
//  House_Project
//
//  Created by lanou3g on 14-10-25.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface HouseLoadResultViewController : UIViewController<MFMessageComposeViewControllerDelegate>
//计算结果
@property (nonatomic, retain)NSArray *loadListArray;
//计算信息
@property (nonatomic, retain)NSArray *inforArray;
@end
