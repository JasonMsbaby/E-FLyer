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
    
}

- (void)btnSelectedClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)disTanceInView{
    BMKCoordinateRegion coorDinateRegion = [self.mapView convertRect:_dragCircleView.frame toRegionFromView:self.view];
    [self.mapView convertRect:_dragCircleView.frame toRegionFromView:self.view];
    CLLocationCoordinate2D coor_start = [self.mapView convertPoint:CGPointMake(_dragCircleView.x, _dragCircleView.y+_dragCircleView.height/2) toCoordinateFromView:self.view];
    CLLocationCoordinate2D coor_end = [self.mapView convertPoint:CGPointMake(_dragCircleView.x+_dragCircleView.width, _dragCircleView.y+_dragCircleView.height/2) toCoordinateFromView:self.view];
    
    BMKMapPoint point_start = BMKMapPointForCoordinate(coor_start);
    BMKMapPoint point_end = BMKMapPointForCoordinate(coor_end);
    self.number_circle.text = [NSString stringWithFormat:@"%.2lf公里",BMKMetersBetweenMapPoints(point_start,point_end)/1000];
    NSLog(@"%f,%f",coorDinateRegion.center.latitude,coorDinateRegion.center.longitude);
}

/*!
 *  添加圆形范围区域
 */
- (void)addcircle{
    CGPoint center = self.mapView.center;
    _dragCircleView = [[UIView alloc]initWithFrame:CGRectMake(center.x, center.y, 100, 100)];
    _dragCircleView.layer.cornerRadius = 50;
    _dragCircleView.backgroundColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:0.500];
    _dragCircleView.layer.borderColor = [[UIColor blueColor] CGColor];
    _dragCircleView.layer.borderWidth = 1;
    _dragCircleView.clipsToBounds = YES;
    _dragCircleView.userInteractionEnabled = YES;
    [_dragCircleView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragCircleView:)]];
    [self.view addSubview:_dragCircleView];
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
 *  @param mapView <#mapView description#>
 *  @param status  <#status description#>
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


-(void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate{
    float lat =  coordinate.latitude;
    float lng = coordinate.longitude;
    //反地理编码出地理位置
    CLLocationCoordinate2D pt=(CLLocationCoordinate2D){0,0};
    pt=(CLLocationCoordinate2D){lat,lng};
    BMKReverseGeoCodeOption *option = [[BMKReverseGeoCodeOption alloc] init];
    option.reverseGeoPoint = pt;
    [self.mapSearch reverseGeoCode:option];
    [SVProgressHUD showWithStatus:@"正在定位..."];
}
//- (void)mapView:(BMKMapView *)mapView annotationView:(BMKAnnotationView *)view didChangeDragState:(BMKAnnotationViewDragState)newState fromOldState:(BMKAnnotationViewDragState)oldState{
//    NSLog(@"。。。。。");
//}
#pragma mark - BMKGeoCodeSearchDelegate
-(void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
    [SVProgressHUD showInfoWithStatus:result.address];
    NSLog(@"%@",result);
}
#pragma mark - circleView拖拽
@end
