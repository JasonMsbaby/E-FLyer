//
//  HouseHeader.h
//  HouseEx
//
//  Created by lanou3g on 14-10-13.
//  Copyright (c) 2014年 邢君莉. All rights reserved.
//

#ifndef HouseEx_HouseHeader_h
#define HouseEx_HouseHeader_h

#define Rect(X, Y, W, H) (CGRectMake((X), (Y), (W), (H)))
#define Size(W, H) (CGSizeMake((W), (H)))
#define Point(X, Y) (CGPointMake((X), (Y)))

#define RandomNumber(A, B) (arc4random() % ((B) - (A) + 1) + (A))

#define Font(N, S) ([UIFont fontWithName:(N) size:(S)])

#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)

#define HousPrice_URL @"http://api.anjuke.com/anjuke/4.0/city/get?app=i-ajk&cid=-1&city_id=14&cv=8.0&from=mobile&i=02018C44-2BCC-4520-ADFA-201410071656&m=iPhone&macid=50dfdd92034dc6fc55417361a7d35922&o=iPhone%2520OS&ostype2=ios6&pm=A01&qtime=20141010161243&udid2=02018C44-2BCC-4520-ADFA-201410071656&uuid2=02018C44-2BCC-4520-ADFA-201410071656&uuid=02018C44-2BCC-4520-ADFA-201410071656&v=6.1.3"


#define HOUSE_PRICE_HOTAREA_URL @"http://api.anjuke.com/mobile/v5/ershou/prop/manage/regionHeat?app=i-ajk&cid=-1&city_id=14&cv=8.0&from=mobile&i=02018C44-2BCC-4520-ADFA-201410071656&m=iPhone&macid=50dfdd92034dc6fc55417361a7d35922&o=iPhone%2520OS&ostype2=ios6&pm=A01&qtime=20141010161243&udid2=02018C44-2BCC-4520-ADFA-201410071656&uuid2=02018C44-2BCC-4520-ADFA-201410071656&uuid=02018C44-2BCC-4520-ADFA-201410071656&v=6.1.3"



#endif
