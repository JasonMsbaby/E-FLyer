//
//  ImageContentView.m
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//

#import "ImageContentView.h"
#import "ContentView.h"
#import "EFGood.h"

@interface ImageContentView ()
@property (nonatomic, strong) UIImageView *picture;
@property(nonatomic,assign) CGFloat currentWith;
//@property(nonatomic,strong) UIScrollView *scrollView;
@end

@implementation ImageContentView

- (instancetype)initWithFrame:(CGRect)frame Width:(CGFloat)width model:(EFGood *)model collor:(UIColor *)collor{
    self = [super initWithFrame:frame];
    UIImage *img = [UIImage imageWithData:[model.img getData]];
    if (self) {
        self.clipsToBounds = YES;
        _picture = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenHeight/1.7)];
        self.picture.image =img;
        //为图片添加捏合手势
        self.picture.userInteractionEnabled = YES;
        [self.picture addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)]];
        //添加拖拽手势
//        [self.picture addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)]];
        self.currentWith = kScreenWidth;
        [self addSubview:self.picture];
        //_picture.contentMode = UIViewContentModeScaleAspectFill;
//        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight / 1.7)];
//        self.scrollView.contentSize = img.size;
//        [self.scrollView addSubview:self.picture];
//        [self addSubview:self.scrollView];
    }
    return self;
}
//捏合手势
- (void)pinchAction:(UIPinchGestureRecognizer *)gesture{
    CGFloat scale = gesture.scale;
    if (gesture.view.frame.size.width < kScreenWidth) {
        gesture.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight/1.7);
    }
    gesture.view.transform = CGAffineTransformScale(gesture.view.transform, scale, scale); //在已缩放大小基础下进行累加变化；区别于：使用 CGAffineTransformMakeScale 方法就是在原大小基础下进行变化
    gesture.scale = 1.0;
}

//- (void)panAction:(UIPanGestureRecognizer *)gesture{
//    NSLog(@"fas");
//}


- (void)imageOffset {
    
    CGRect centerToWindow = [self convertRect:self.bounds toView:nil];

    CGFloat centerX = CGRectGetMidX(centerToWindow);
    CGPoint windowCenter = self.window.center;

    CGFloat cellOffsetX = centerX - windowCenter.x;

    CGFloat offsetDig =  cellOffsetX / self.window.frame.size.height *2;

    CGAffineTransform transX = CGAffineTransformMakeTranslation(- offsetDig * kWidth * 0.7, 0);


    self.picture.transform = transX;
}

@end
