//
//  PopView.h
//  E-flyer
//  弹出视图基座
//  Created by Jason_Msbaby on 16/3/14.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopViewDataSource <NSObject>

- (UIView *)popViewWithBottomeView;

@end

@interface PopView : UIView

@property(assign,nonatomic) id<PopViewDataSource> dataSource;



- (void)show;

- (void)hidden;

@end
