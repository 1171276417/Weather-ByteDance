//
//  Singleton.h
//  Weather
//
//  Created by 邓杰 on 2022/7/27.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject

@property(nonatomic, strong) CLLocation *SelfLocation;//通过定位获取的本地地址
@property(nonatomic, strong) NSString *SearchLocation;//搜索结果的地址经纬度
@property(nonatomic, strong) NSString *SeatchCityName;//搜索结果的城市名
@property(nonatomic, strong) NSMutableArray *AddCityListArray;//添加城市的列表
@property(nonatomic, strong) NSMutableArray *AddCityNameArray;//城市名
@property(nonatomic ) BOOL isInSearch;//是否在搜索界面
@property(nonatomic ) int page;//城市的页数



+ (Singleton *)sharedManager;

@end

NS_ASSUME_NONNULL_END
