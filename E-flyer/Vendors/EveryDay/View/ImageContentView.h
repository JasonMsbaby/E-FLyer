//
//  ImageContentView.h
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContentView;
@class EFGood;

@interface ImageContentView : UIView

//@property (nonatomic, strong) ContentView *contentView;





- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(EFGood *)model collor:(UIColor *)collor;

- (void)imageOffset;
@end
