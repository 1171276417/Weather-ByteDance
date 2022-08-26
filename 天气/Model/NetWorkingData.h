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
typedef void(^LivingListLoadBlock)(NSArray<GetListItem *> *dataArray);//生活指数
typedef void(^WeiboListItemLoadBlock)(NSArray<GetListItem *> *dataArray);//获取网络微博数据
typedef void(^CommentListItemLoadBlock)(NSArray<GetListItem *> *dataArray);//获取评论数据
typedef void(^SelectionListItemLoadBlock)(NSArray<GetListItem *> *dataArray);//获取微博网页数据
typedef void(^SelectionCommentBlock)(NSArray<GetListItem *> *dataArray);//获取微博网页数据



@interface NetWorkingData : NSObject
///获取实时天气数据
- (void)LoadRealTimeItemDataBlock:(RealTimeListItemLoadBlock)finishBlock AndLocation:(NSString *)Location andPage:(int)page;
////获取24小时逐小时温度
- (void)LoadFutureOneDayListItemBlock:(FutureOneDayListItemLoadBlock)finishBlock AndLocation:(NSString *)Location andPage:(int)page;
////获取7天温度
- (void)LoadFutureSevenDayListItemBlock:(FutureSevenDayListItemLoadBlock)finishBlock AndLocation:(NSString *)Location andPage:(int)page;
///获取实时空气质量
- (void)LoadAirQualityListItemBlock:(AirQualityListItemLoadBlock)finishBlock AndLocation:(NSString *)Location andPage:(int)page;
///获取城市列表
- (void)LoadCityListItemBlock:(CityListLoadBlock)finishBlock;
///生活指数
- (void)LoadLivingListItemBlock:(LivingListLoadBlock)finishBlock AndLocation:(NSString *)Location;

- (void)LoadListDataBlock:(WeiboListItemLoadBlock)finishBlock andpage:(int)page;
- (void)LoadCommentListDataBlock:(CommentListItemLoadBlock)finishBlock andID:(NSNumber *)ID;
- (void)LoadSelectionListDataBlock:(SelectionListItemLoadBlock)finishBlock URL:(NSString *)URL andPage:(int)page;
- (void)LoadSelectionCommentBlock:(SelectionCommentBlock)finishBlock andid:(NSString *)ID uid:(NSString *)uid;

@end

NS_ASSUME_NONNULL_END
