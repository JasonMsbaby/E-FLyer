//
//  ShowBMKMap.m
//  E-flyer
//
//  Created by Jason_Msbaby on 16/4/13.
//  Copyright © 2016年 Jason_Msbaby. All rights reserved.
//
#import "ShowBMKMap.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Search/BMKGeocodeSearch.h>
@interface ShowBMKMap ()<BMKMapViewDelegate,BMKGeoCodeSearchDelegate>
@property(strong,nonatomic) BMKMapView *mapView;
@property(strong,nonatomic) BMKGeoCodeSearch *mapSearch;
@end

@implementation ShowBMKMap

-(void)viewWillAppear:(BOOL)animated
{
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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"却盾构" style:(UIBarButtonItemStyleDone) target:self action:@selector(btnSelectedClick)];
    self.mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    self.mapSearch = [[BMKGeoCodeSearch alloc] init];
    self.view = self.mapView;
}

- (void)btnSelectedClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - BMKMapViewDelegate

- (void)mapViewDidFinishLoading:(BMKMapView *)mapView{
    [SVProgressHUD dismiss];
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
}
#pragma mark - BMKGeoCodeSearchDelegate
-(void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
    NSLog(@"%@",result);
}
@end
