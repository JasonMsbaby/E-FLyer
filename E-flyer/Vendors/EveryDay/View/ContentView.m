//
//  ContentView.m
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "ContentView.h"
#import "CustomView.h"

@implementation ContentView

- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(EFGood *)model collor:(UIColor *)collor{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:(UIBlurEffectStyleLight)];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.frame = self.bounds;
        [self addSubview:effectView];

        
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textColor = collor;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
        }];
        
        _lineView = [UIView new];
        _lineView.backgroundColor = collor;
        [self addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(_titleLabel);
            make.top.equalTo(_titleLabel.mas_bottom).offset(2);
            make.height.equalTo(@1);
        }];
        
        _littleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 46, kWidth, 20)];
        _littleLabel.textColor = collor;
        _littleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_littleLabel];
        
        _descripLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 80, kWidth - 10, 90)];
        _descripLabel.font = [UIFont systemFontOfSize:14];
        _descripLabel.numberOfLines = 0;
        _descripLabel.textColor = collor;
        [self addSubview:_descripLabel];
        
        CGFloat y = _descripLabel.frame.size.height + 90;
        _collectionCustom = [[CustomView alloc]initWithFrame:CGRectMake(5, y, (kWidth - 10) / 4, 30) Width:width LabelString:@"123" collor:collor];
        [self addSubview:_collectionCustom];
        
        _shareCustom = [[CustomView alloc]initWithFrame:CGRectMake((kWidth - 10) / 4 + 5, y, (kWidth - 10) / 4, 30) Width:width LabelString:@"456" collor:collor];
        [self addSubview:_shareCustom];
        _cacheCustom = [[CustomView alloc]initWithFrame:CGRectMake(_shareCustom.frame.origin.x + _shareCustom.frame.size.width, y, (kWidth - 10) / 4, 30) Width:width LabelString:@"缓存" collor:collor];
        [self addSubview:_cacheCustom];
        _replyCustom = [[CustomView alloc]initWithFrame:CGRectMake(_cacheCustom.frame.origin.x + _cacheCustom.frame.size.width, y, (kWidth - 10) / 4, 30) Width:width LabelString:@"789" collor:collor];
        [self addSubview:_replyCustom];

        [self setData:model];
    }
    return self;
}

- (void)setData:(EFGood *)model {

    self.titleLabel.text = model.title;
    self.descripLabel.text = model.content;
    //[self.shareCustom setTitle:model.shareCount];
    //[self.replyCustom setTitle:model.replyCount];
    //[self.collectionCustom setTitle:model.collectionCount];

    //NSInteger time = [model.duration integerValue];
   // NSString *timeString = [NSString stringWithFormat:@"%02ld'%02ld''",time/60,time% 60];//显示的是音乐的总时间
    //NSString *string = [NSString stringWithFormat:@"#%@ / %@",model.category, timeString];
//    self.littleLabel.text = string;


//    __weak typeof(self) weakSelf = self;

//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.img.url]];

//    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:model.img.url] options:(SDWebImageRetryFailed) progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//
//        if (image) {
//            
//            CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
//            contentsAnimation.duration = 1.0f;
//            contentsAnimation.fromValue = self.imageView.image ;
//            contentsAnimation.toValue = image;
//
//            contentsAnimation.removedOnCompletion = YES;
//            contentsAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//            [weakSelf.imageView.layer addAnimation:contentsAnimation forKey:nil];
//
//            weakSelf.imageView.image = image;
//
//        }
//
//    }];
}


@end
