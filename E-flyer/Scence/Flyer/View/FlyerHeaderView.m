//
//  FlyerHeaderView.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/2/29.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//

#import "FlyerHeaderView.h"
#import "Constanst.h"
#import <UIButton+WebCache.h>
#import <AVOSCloud.h>
@interface FlyerHeaderView ()

@end
@implementation FlyerHeaderView



- (void)setData:(NSArray<EFCategroy *> *)data{
    if (_data != data) {
        _data = nil;
        _data = data;
        [self layout];
    }
}
- (void)layout{
    int index = 0;
    CGFloat w = kScreenWidth/4;
    for(int i = 0; i < 2; i++){
        for (int j = 0; j < 4; j++) {
            
            EFCategroy *categroy = _data[index];
            
            UIView *view  = [[UIView alloc]initWithFrame:CGRectMake(j*w, i*w, w, w)];

            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(w/3/2, w/3/2, w/3*2, w/3*2)];
            NSString *url = categroy.image.url;
            
            [btn sd_setImageWithURL:[NSURL URLWithString:url] forState:(UIControlStateNormal)];
            
            btn.layer.cornerRadius = w/3;
            btn.clipsToBounds = YES;
            
            UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, w/8*7, w, 20)];
            lbl.textAlignment = NSTextAlignmentCenter;
            lbl.text = categroy.name;
            
            [view addSubview:lbl];
            [view addSubview:btn];
            
            [self addSubview:view];
            index++;
        }
    }
    
}


@end
