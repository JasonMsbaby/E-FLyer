//
//  LrdAlertTableView.h
//  AlertTableView
//
//  Created by 键盘上的舞者 on 3/28/16.
//  Copyright © 2016 键盘上的舞者. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LrdDateModel;

typedef void(^DidSelectedBlock)(NSInteger row,LrdDateModel *model);

@interface LrdAlertTableView : UIView


- (instancetype)initWithTitle:(NSString *)title SubTitle:(NSString *)subTitle;

//从外面传进来的数据数组
@property (nonatomic, strong) NSMutableArray<LrdDateModel *> *dataArray;

@property(copy,nonatomic) DidSelectedBlock block;
//弹出
- (void)pop;

//隐藏
- (void)dismiss;

@end
