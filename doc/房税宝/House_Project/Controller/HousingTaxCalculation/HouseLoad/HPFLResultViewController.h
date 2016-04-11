//
//  HPFLResultViewController.h
//  House_Project
//
//  Created by lanou3g on 14-10-26.
//  Copyright (c) 2014年 House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface HPFLResultViewController : UIViewController<MFMessageComposeViewControllerDelegate>
//结果数组
@property (nonatomic, retain)NSArray *HPFLArray;
//计算信息
@property (nonatomic, retain)NSArray *inforArray;
@end
