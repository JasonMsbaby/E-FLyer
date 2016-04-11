//
//  ResultViewController.h
//  House_Project
//
//  Created by lanou3g on 14-10-16.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface ResultViewController : UIViewController<MFMessageComposeViewControllerDelegate>
//房税数组初始化
@property (nonatomic, retain)NSArray *taxArray;
//label数组
@property (nonatomic, retain)NSMutableArray *labelArray;
//房源信息数组
@property (nonatomic, retain)NSMutableArray *inforArray;
@end
