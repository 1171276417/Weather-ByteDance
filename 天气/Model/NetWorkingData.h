//
//  NetWorkingData.h
//  Weather
//
//  Created by 邓杰 on 2022/8/12.
//

#import <Foundation/Foundation.h>
#import "GetListItem.h"
#import "AFNetworking/AFNetworking.h"
#import "UIKit+AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^RealTimeListItemLoadBlock)(NSArray<GetListItem *> *dataArray);//实时预测
typedef void(^FutureOneDayListItemLoadBlock)(NSArray<GetListItem *> *dataArray);//24小时逐小时温度
typedef void(^FutureSevenDayListItemLoadBlock)(NSArray<GetListItem *> *dataArray);//预测七天温度
typedef void(^AirQualityListItemLoadBlock)(NSArray<GetListItem *> *dataArray);//空气质量
typedef void(^CityListLoadBlock)(NSArray *dataArray);//城市列表



@interface NetWorkingData : NSObject
///获取实时天气数据
- (void)LoadRealTimeItemDataBlock:(RealTimeListItemLoadBlock)finishBlock AndLocation:(NSString *)Location;
////获取24小时逐小时温度
- (void)LoadFutureOneDayListItemBlock:(FutureOneDayListItemLoadBlock)finishBlock AndLocation:(NSString *)Location;
////获取7天温度
- (void)LoadFutureSevenDayListItemBlock:(FutureSevenDayListItemLoadBlock)finishBlock AndLocation:(NSString *)Location;
///获取实时空气质量
- (void)LoadAirQualityListItemBlock:(AirQualityListItemLoadBlock)finishBlock AndLocation:(NSString *)Location;
///获取城市列表
- (void)LoadCityListItemBlock:(CityListLoadBlock)finishBlock;



@end

NS_ASSUME_NONNULL_END
