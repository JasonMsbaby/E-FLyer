//
//  EFTabBar.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/26.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "EFUser.h"
#import "EFTabBar.h"
@interface EFTabBar()
/** * 添加增加按钮 */
@property (nonatomic,assign) UserRoleType userType;
@end
@implementation EFTabBar



-(UIButton *)addButton
{
    if (_addButton == nil && self.userType == UserRoleTypeBar) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:[UIImage imageNamed:@"tab_add"] forState:UIControlStateNormal];
        //[btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"tab_add_select"] forState:UIControlStateHighlighted];
        //[btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        _addButton = btn;
        
        //是按钮的尺寸默认跟背景图片一样大
        [btn sizeToFit];
        
        [self addSubview:_addButton];
        
    }
    return _addButton;
}



//调整子空间的位置
-(void)layoutSubviews
{
    [super layoutSubviews];
    EFUser *currentUser = [EFUser currentUser];
    NSInteger type = currentUser.type;
    type = currentUser == nil ? -1 : currentUser.type;
    self.userType = type;
    if (self.userType == UserRoleTypeBar) {
        CGFloat w = self.bounds.size.width;
        CGFloat h = self.bounds.size.height;
        CGFloat btnX = 0;
        CGFloat btnY = 0;
        CGFloat btnW = w / 5;
        CGFloat btnH = h;
        
        int i = 0;
        
        //1 , 遍历当前tabBar上的所有view
        for (UIView *tabBarBtn in self.subviews) {
            //2，如果是UITabBarButton，就取出来重新设置他们的位置
            if ([tabBarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                
                btnX = i * btnW;
                
                tabBarBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
                
                
                //当到了第二个时候，再加一个位置空竹添加按钮的位置。
                if (i==1) {
                    i++;
                }
                
                i++;
                
                
            }
        }
        
        //设置添加按钮 add按钮的位置
        self.addButton.center = CGPointMake(w * 0.5, h * 0.5);
    }else{
        [self.addButton removeFromSuperview];
    }
}


@end
