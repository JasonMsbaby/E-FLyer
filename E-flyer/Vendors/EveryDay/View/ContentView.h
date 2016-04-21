
#import "EFGood.h"
#import <UIKit/UIKit.h>
@class CustomView;

@interface ContentView : UIView

- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(EFGood *)model collor:(UIColor *)collor;

- (void)setData:(EFGood *)model;

@end
