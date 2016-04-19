//
//  rilegouleView.m
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//

#import "rilegouleView.h"
#import "ContentView.h"
#import "ContentScrollView.h"
#import "EFGood.h"
#import "EveryDayTableViewCell.h"

@implementation rilegouleView

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray index:(NSInteger)index{
    
    self = [super initWithFrame:frame];
    
    if (self) {

        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;

        self.contentMode = UIViewContentModeTop;
        self.clipsToBounds = YES;
        _scrollView = [[ContentScrollView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) imageArray:imageArray index:index];
        [self addSubview:_scrollView];

        self.scrollView.userInteractionEnabled = YES;

        EFGood *model = imageArray[index];

        _contentView = [[ContentView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight - kHeight / 1.7) Width:35 model:model collor:[UIColor whiteColor]];
        [_contentView setData:model];
        [self addSubview:_contentView];

        _animationView = [[EveryDayTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
        [_animationView.coverview removeFromSuperview];

        [self addSubview:_animationView];

        _scrollView.alpha = 0;
    }
    return self;
}

- (void)aminmationShow{

    self.contentView.frame = CGRectMake(0, self.offsetY, kWidth, 250);
    self.animationView.frame = CGRectMake(0, self.offsetY, kWidth, 250);
    self.animationView.picture.transform = self.animationTrans;
    
    [UIView animateWithDuration:0.5 animations:^{

        self.animationView.frame = CGRectMake(0, 0, kWidth, kHeight / 1.7);
        self.animationView.picture.transform = CGAffineTransformMakeTranslation(0,  (kHeight / 1.7 - 250)/2);

        self.contentView.frame = CGRectMake(0, kHeight / 1.7, kWidth, kHeight - kHeight / 1.7);
    } completion:^(BOOL finished) {

        self.scrollView.alpha = 1;

        [UIView animateWithDuration:0.25 animations:^{

            self.animationView.alpha = 0;

        } completion:^(BOOL finished) {
            
        }];
    }];


}

- (void)animationDismissUsingCompeteBlock:(void (^)(void))complete {

    [UIView animateWithDuration:0.25 animations:^{

        self.animationView.alpha = 1;
    } completion:^(BOOL finished) {

        self.scrollView.alpha = 0;
        [UIView animateWithDuration:0.5 animations:^{

            CGRect rec = self.animationView.frame;
            rec.origin.y = self.offsetY;
            rec.size.height = 250;
            self.animationView.frame = rec;
            self.animationView.picture.transform = self.animationTrans;
            self.contentView.frame = rec;

        } completion:^(BOOL finished) {

            self.animationTrans = CGAffineTransformIdentity;

            [self.contentView removeFromSuperview];

            [UIView animateWithDuration:0.25 animations:^{
                self.animationView.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];

                complete();
            }];

        }];
    }];
    

}


@end
