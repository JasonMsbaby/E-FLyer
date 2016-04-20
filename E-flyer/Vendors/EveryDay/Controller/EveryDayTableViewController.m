//
//  EveryDayTableViewController.m
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//
#import <SDWebImageManager.h>
#import "EveryDayTableViewController.h"
#import <MJRefresh.h>
#import "EveryDayTableViewCell.h"
#import "ContentScrollView.h"
#import "ContentView.h"
#import "rilegouleView.h"
#import "CustomView.h"
#import "ImageContentView.h"
#import <UIImageView+WebCache.h>


@interface SDWebImageManager  (cache)


- (BOOL)memoryCachedImageExistsForURL:(NSURL *)url;

@end

@implementation SDWebImageManager (cache)

- (BOOL)memoryCachedImageExistsForURL:(NSURL *)url {
    NSString *key = [self cacheKeyForURL:url];
    return ([self.imageCache imageFromMemoryCacheForKey:key] != nil) ?  YES : NO;
}

@end


@interface EveryDayTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) rilegouleView *rilegoule;

@property(strong,nonatomic) UITableView *tableView;

@property(nonatomic,assign) NSInteger index;

@property (nonatomic, retain) NSMutableArray<EFGood *> *dateArray;

@end

@implementation EveryDayTableViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
}


#pragma mark ----------------- 加载页面 ----------------
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dateArray = [NSMutableArray array];
    [super viewDidLoad];
    [self loadTableView];
    [self loadBack];
    [self addMJRefresh];
    [self loadData];
}

//加载数据
- (void)loadData{
    self.index = self.index == 0 ? 1 : self.index;
    WeakObj(self)
    [EFGood loadDataWithCategroy:self.categroy PageIndex:self.index Block:^(NSArray<EFGood *> *result) {
        if (result.count == 0) {
            [selfWeak.tableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            if (selfWeak.index == 1) {
                [selfWeak.dateArray removeAllObjects];
            }
            [selfWeak.dateArray addObjectsFromArray:result];
            [selfWeak.tableView.mj_footer endRefreshing];
            [selfWeak.tableView.mj_header endRefreshing];
            [selfWeak.tableView reloadData];
        }
    }];
}

/*!
 *  添加上拉 下拉刷新
 */
- (void)addMJRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.index = 1;
        [self loadData];
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.index++;
        [self loadData];
    }];
}

- (void)loadBack{
    UIButton *back = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [back setImage:[UIImage imageNamed:@"left_back"] forState:(UIControlStateNormal)];
    [back addTarget:self action:@selector(btnBack) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(self.view).offset(30);
        make.width.height.equalTo(@30);
    }];
    [self.view bringSubviewToFront:back];
}
//添加返回按钮
- (void)btnBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadTableView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[EveryDayTableViewCell class] forCellReuseIdentifier:@"哈哈"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dateArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EveryDayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"哈哈" forIndexPath:indexPath];

    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 250;
    
}


//添加每个cell出现时的3D动画
-(void)tableView:(UITableView *)tableView willDisplayCell:(EveryDayTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{


    EFGood *model = self.dateArray[indexPath.row];

    if (![[SDWebImageManager sharedManager] memoryCachedImageExistsForURL:[NSURL URLWithString:model.img.url]]) {

        CATransform3D rotation;//3D旋转

        rotation = CATransform3DMakeTranslation(0 ,50 ,20);
//        rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
        //逆时针旋转

        rotation = CATransform3DScale(rotation, 0.9, .9, 1);

        rotation.m34 = 1.0/ -600;

        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        cell.alpha = 0;

        cell.layer.transform = rotation;

        [UIView beginAnimations:@"rotation" context:NULL];
        //旋转时间
        [UIView setAnimationDuration:0.6];
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
        [UIView commitAnimations];
    }

    [cell cellOffset];
    cell.model = model;
}


#pragma mark ---------- 单元格代理方法 ----------

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self showImageAtIndexPath:indexPath];
}


#pragma mark --------- 设置待播放界面 ----------

- (void)showImageAtIndexPath:(NSIndexPath *)indexPath{
    _currentIndexPath = indexPath;

    EveryDayTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    CGRect rect = [cell convertRect:cell.bounds toView:nil];
    CGFloat y = rect.origin.y;

    _rilegoule = [[rilegouleView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) imageArray:self.dateArray index:indexPath.row];
    _rilegoule.offsetY = y;
    _rilegoule.animationTrans = cell.picture.transform;
    _rilegoule.animationView.picture.image = cell.picture.image;

    _rilegoule.scrollView.delegate = self;
    
    [[self.tableView superview] addSubview:_rilegoule];
    
    //添加点击收回手势
    _rilegoule.contentView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [_rilegoule.scrollView addGestureRecognizer:tap];

    [_rilegoule aminmationShow];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if ([scrollView isEqual:_rilegoule.scrollView]) {

        for (ImageContentView *subView in scrollView.subviews) {

            if ([subView respondsToSelector:@selector(imageOffset)] ) {
                [subView imageOffset];
            }
        }

        CGFloat x = _rilegoule.scrollView.contentOffset.x;

        CGFloat off = ABS( ((int)x % (int)kWidth) - kWidth/2) /(kWidth/2) + .2;

        [UIView animateWithDuration:1.0 animations:^{
            
            for (UIView *v in _rilegoule.contentView.subviews) {
                v.alpha = off + 0.3;
            }
            
        }];

    } else {

     NSArray<EveryDayTableViewCell *> *array = [self.tableView visibleCells];

        [array enumerateObjectsUsingBlock:^(EveryDayTableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

            [obj cellOffset];
        }];

    }

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    if ([scrollView isEqual:_rilegoule.scrollView]) {

        int index = floor((_rilegoule.scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width) + 1;

        _rilegoule.scrollView.currentIndex = index;

        self.currentIndexPath = [NSIndexPath indexPathForRow:index inSection:self.currentIndexPath.section];

        [self.tableView scrollToRowAtIndexPath:self.currentIndexPath atScrollPosition:(UITableViewScrollPositionMiddle) animated:NO];

        [self.tableView setNeedsDisplay];
        EveryDayTableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.currentIndexPath];

        [cell cellOffset];

        CGRect rect = [cell convertRect:cell.bounds toView:nil];
        _rilegoule.animationTrans = cell.picture.transform;
        _rilegoule.offsetY = rect.origin.y;

        EFGood *model = self.dateArray[index];
        
        [_rilegoule.contentView setData:model];

        [_rilegoule.animationView.picture sd_setImageWithURL:[NSURL URLWithString: model.img.url]];

    }
}

#pragma mark -------------- 点击手势触发事件 -----------

- (void)tapAction{
    [_rilegoule animationDismissUsingCompeteBlock:^{
        _rilegoule = nil;
    }];
}

@end
