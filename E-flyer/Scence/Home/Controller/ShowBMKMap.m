//
//  ShowBMKMap.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/13.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import <Masonry.h>
#import "UIView+EFView.h"
#import "ShowBMKMap.h"
#import <BaiduMapAPI_Utils/BMKGeometry.h>
#import <BaiduMapAPI_Map/BMKCircle.h>
#import <BaiduMapAPI_Map/BMKCircleView.h>
#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
#import <BaiduMapAPI_Map/BMKPinAnnotationView.h>
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Search/BMKGeocodeSearch.h>
@interface ShowBMKMap ()<BMKMapViewDelegate,BMKGeoCodeSearchDelegate>
@property(strong,nonatomic) BMKMapView *mapView;
@property(strong,nonatomic) BMKGeoCodeSearch *mapSearch;
@property(assign,nonatomic) CLLocationCoordinate2D position;
@property(strong,nonatomic) UIView *dragCircleView;
@property(strong,nonatomic) UILabel *number_circle;
@property(assign,nonatomic) CGFloat distance;
@property(strong,nonatomic) EFBMKModel *model;//确定最终选择的model
//@property(strong,nonatomic) BMKCircle *circle;
//@property(strong,nonatomic) BMKCircleView *circleView;
//@property(strong,nonatomic) BMKPointAnnotation *pointAn;
@end

@implementation ShowBMKMap

-(void)viewWillAppear:(BOOL)animated
{
    
    //    [self drawCircle];
    //    [self addAnnotationView];
    
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _mapSearch.delegate = self;
    [self disTanceInView];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _mapSearch.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD show];
    self.title = @"地图选点";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:(UIBarButtonItemStyleDone) target:self action:@selector(btnSelectedClick)];
    
    
    self.mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    self.mapSearch = [[BMKGeoCodeSearch alloc] init];
    self.mapView.zoomLevel = 18;
    self.position = self.mapView.centerCoordinate;
    self.view = self.mapView;
    
    [self addcircle];
    [self addCircleSlide];
    
}
/*!
 *  添加控制圆形的大小
 */
- (void)addCircleSlide{
    UISlider *slide = [[UISlider alloc] init];
    slide.backgroundColor = [UIColor whiteColor];
    slide.minimumValue = 55;
    slide.maximumValue = kScreenWidth;
    slide.value = kScreenWidth/2;
    [self.view addSubview:slide];
    [slide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.width.bottom.equalTo(self.view);
    }];
    [slide addTarget:self action:@selector(slideChanged:) forControlEvents:(UIControlEventValueChanged)];
}
/*!
 *  滑块改变的时候触发
 *
 *  @param slider
 */
- (void)slideChanged:(UISlider *)slider{
    [self.dragCircleView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(slider.value));
    }];
    self.dragCircleView.layer.cornerRadius = slider.value/2;
    [self disTanceInView];
    NSLog(@"%lf",slider.value);
}
/*!
 *  选中之后返回数据
 */
- (void)btnSelectedClick{
    if (self.block != nil) {
        self.model = [EFBMKModel new];
        self.model.lat = self.position.latitude;
        self.model.lng = self.position.longitude;
        self.model.scope = self.distance;
        self.model.zoomLevel = self.mapView.zoomLevel;
        //    //反地理编码出地理位置
        BMKReverseGeoCodeOption *option = [[BMKReverseGeoCodeOption alloc] init];
        option.reverseGeoPoint = self.position;
        [self.mapSearch reverseGeoCode:option];
        [SVProgressHUD show];
    }
}
/*!
 *  重新计算圆形覆盖物的直径实际距离
 */
- (void)disTanceInView{
    BMKCoordinateRegion coorDinateRegion = [self.mapView convertRect:_dragCircleView.frame toRegionFromView:self.view];
    [self.mapView convertRect:_dragCircleView.frame toRegionFromView:self.view];
    CLLocationCoordinate2D coor_start = [self.mapView convertPoint:CGPointMake(_dragCircleView.x, _dragCircleView.y+_dragCircleView.height/2) toCoordinateFromView:self.view];
    CLLocationCoordinate2D coor_end = [self.mapView convertPoint:CGPointMake(_dragCircleView.x+_dragCircleView.width, _dragCircleView.y+_dragCircleView.height/2) toCoordinateFromView:self.view];
    
    BMKMapPoint point_start = BMKMapPointForCoordinate(coor_start);
    BMKMapPoint point_end = BMKMapPointForCoordinate(coor_end);
    
    self.distance = BMKMetersBetweenMapPoints(point_start,point_end);
    
    self.number_circle.text = [NSString stringWithFormat:@"%.2lf公里",BMKMetersBetweenMapPoints(point_start,point_end)/1000];
    self.position = coorDinateRegion.center;
    NSLog(@"%f,%f",coorDinateRegion.center.latitude,coorDinateRegion.center.longitude);
}

/*!
 *  添加圆形范围区域
 */
- (void)addcircle{
    _dragCircleView = [[UIView alloc]init];
    _dragCircleView.layer.cornerRadius = kScreenWidth/4;
    _dragCircleView.backgroundColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:0.300];
    _dragCircleView.layer.borderColor = [[UIColor blueColor] CGColor];
    _dragCircleView.layer.borderWidth = 1;
    _dragCircleView.clipsToBounds = YES;
    _dragCircleView.userInteractionEnabled = YES;
    [_dragCircleView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragCircleView:)]];
    [self.view addSubview:_dragCircleView];
    [_dragCircleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@(kScreenWidth/2));
    }];
    _number_circle = [UILabel new];
    [_dragCircleView addSubview:_number_circle];
    [_number_circle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_dragCircleView);
    }];
    _number_circle.textColor = [UIColor whiteColor];
    _number_circle.font = [UIFont systemFontOfSize:12];
    _number_circle.text = @"10km";
}
/*!
 *  绘制图层
 */
//- (void)drawCircle{
//    _circle = [BMKCircle circleWithCenterCoordinate:self.position radius:100];
//    [self.mapView addOverlay:_circle];
//}
/*!
 *  添加标注
 */
//- (void)addAnnotationView{
//    _pointAn = [[BMKPointAnnotation alloc] init];
//    _pointAn.coordinate = self.position;
//    [self.mapView addAnnotation:_pointAn];
//}

#pragma mark - BMKMapViewDelegate

- (void)mapViewDidFinishLoading:(BMKMapView *)mapView{
    [SVProgressHUD dismiss];
}
/*!
 *  重绘地图时候调用
 *
 *  @param mapView
 *  @param status
 */
-(void)mapView:(BMKMapView *)mapView onDrawMapFrame:(BMKMapStatus *)status{
    [self disTanceInView];
}

//- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay{
//    if ([overlay isKindOfClass:[BMKCircle class]]){
//        if (_circleView == nil) {
//            _circleView = [[BMKCircleView alloc] initWithOverlay:overlay];
//            _circleView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.5];
//            _circleView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
//            _circleView.lineWidth = 2.0;
//            _circleView.userInteractionEnabled = YES;
//            NSLog(@"%d",_circleView.isUserInteractionEnabled);
//        }
//        NSLog(@"%@",_circleView);
//        return _circleView;
//    }
//    return nil;
//}

//- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
//    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
//        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
//        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
//        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
//        return newAnnotationView;
//    }
//    return nil;
//}


- (void)dragCircleView:(UIPanGestureRecognizer *)recognizer{
    CGPoint location = [recognizer locationInView:self.view];
    self.dragCircleView.center = location;
    [self disTanceInView];
}


//-(void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate{
//    float lat =  coordinate.latitude;
//    float lng = coordinate.longitude;
//    //反地理编码出地理位置
//    CLLocationCoordinate2D pt=(CLLocationCoordinate2D){0,0};
//    pt=(CLLocationCoordinate2D){lat,lng};
//    BMKReverseGeoCodeOption *option = [[BMKReverseGeoCodeOption alloc] init];
//    option.reverseGeoPoint = pt;
//    [self.mapSearch reverseGeoCode:option];
//    [SVProgressHUD showWithStatus:@"正在定位..."];
//}
//- (void)mapView:(BMKMapView *)mapView annotationView:(BMKAnnotationView *)view didChangeDragState:(BMKAnnotationViewDragState)newState fromOldState:(BMKAnnotationViewDragState)oldState{
//    NSLog(@"。。。。。");
//}
#pragma mark - BMKGeoCodeSearchDelegate
-(void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
    NSString *msg = [NSString stringWithFormat:@"您将投放于【%@】方圆【%.2f】公里之内区域",result.address,self.distance/1000];
    self.model.address = result.address;
    [SVProgressHUD dismiss];
    WeakObj(self)
    [self alerWithTitle:@"投放区域" Message:msg CallBack:^{
        self.block(self.model);
        [selfWeak.navigationController popViewControllerAnimated:YES];
    }];
}
#pragma mark - circleView拖拽
@end
