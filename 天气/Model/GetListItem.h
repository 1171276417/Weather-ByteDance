//
//  GetListItem.h
//  Weather
//
//  Created by 邓杰 on 2022/8/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetListItem : NSObject <NSCoding,NSCopying>


#pragma mark -目前实时预测天气情况
///数据最近观测时间
@property(nonatomic, strong)NSString *obsTime;
///实时温度
@property(nonatomic, strong)NSString *now_temperature;
///实时体感温度
@property(nonatomic, strong)NSString *now_feelsLike;
///实时天气图标代码
@property(nonatomic, strong)NSString *now_icon;
///实时天气描述
@property(nonatomic, strong)NSString *now_describe;
///实时风角度
@property(nonatomic, strong)NSString *now_wind360;
///实时风向
@property(nonatomic, strong)NSString *now_windDirection;
///实时风力等级
@property(nonatomic, strong)NSString *now_windScale;
///实时风速
@property(nonatomic, strong)NSString *now_windSpeed;
///实时相对湿度
@property(nonatomic, strong)NSString *now_humidity;
///实时当前一小时累计降水量
@property(nonatomic, strong)NSString *now_precip;
///实时压强
@property(nonatomic, strong)NSString *now_pressurep;
///实时能见度
@property(nonatomic, strong)NSString *now_vis;
///实时云量
@property(nonatomic, strong)NSString *now_cloud;
///实时露点温度
@property(nonatomic, strong)NSString *now_dew;
///模型化实时天气数据
- (void)RealTimeModelListItemData:(NSDictionary *)dictionary;



#pragma mark -24小时预测天气情况
///每小时预报时刻
@property(nonatomic, strong) NSString *hourly_fxTime;
///每小时预报温度
@property(nonatomic, strong) NSString *hourly_temperature;
///每小时预报天气图标代码
@property(nonatomic, strong) NSString *hourly_icon;
///每小时预报气候描述
@property(nonatomic, strong) NSString *hourly_describe;
///每小时预报风角度
@property(nonatomic, strong) NSString *hourly_wind360;
///每小时预报风向
@property(nonatomic, strong) NSString *hourly_windDirection;
///每小时预报风力等级
@property(nonatomic, strong) NSString *hourly_windScale;
///每小时预报风速
@property(nonatomic, strong) NSString *hourly_windSpeed;
///每小时预报相对湿度
@property(nonatomic, strong) NSString *hourly_humidity;
///每小时预报一小时累计降水量
@property(nonatomic, strong) NSString *hourly_precip;
///每小时预报降水概率
@property(nonatomic, strong) NSString *hourly_pop;
///每小时预报大气压强
@property(nonatomic, strong) NSString *hourly_pressure;
///每小时预报云量
@property(nonatomic, strong) NSString *hourly_cloud;
///每小时预报露点温度
@property(nonatomic, strong) NSString *hourly_dew;
///模型化24小时天气数据
- (void)FutureOneDayModelListItemData:(NSDictionary *)dictionary;


#pragma mark -未来七天预测天气情况
///时间日期
@property(nonatomic, strong) NSString *daily_fxDate;
///日升时间
@property(nonatomic, strong) NSString *daily_sunrise;
///日落时间
@property(nonatomic, strong) NSString *daily_sunset;
///月升时间
@property(nonatomic, strong) NSString *daily_moonrise;
///月落时间
@property(nonatomic, strong) NSString *daily_moonset;
///月相名称
@property(nonatomic, strong) NSString *daily_moonPhase;
///月相图标代码
@property(nonatomic, strong) NSString *daily_moonPhaseIcon;
///预测当天最高温度
@property(nonatomic, strong) NSString *daily_tempMax;
///预测当天最低温度
@property(nonatomic, strong) NSString *daily_tempMin;
///预测当天白天天气状况图片代码
@property(nonatomic, strong) NSString *daily_iconDay;
///预测当天白天天气情况描述
@property(nonatomic, strong) NSString *daily_describeDay;
///预测当天晚上天气图标代码
@property(nonatomic, strong) NSString *daily_iconNight;
///预测当天晚上天气情况描述
@property(nonatomic, strong) NSString *daily_describeNight;
///预测当天白天风角度
@property(nonatomic, strong) NSString *daily_wind360Day;
///预测当天白天风方向
@property(nonatomic, strong) NSString *daily_windDirDay;
///预测当天白天风力等级
@property(nonatomic, strong) NSString *daily_windScaleDay;
////预测当天白天风速
@property(nonatomic, strong) NSString *daily_windSpeedDay;
///预测当天晚上风角度
@property(nonatomic, strong) NSString *daily_wind360Night;
///预测当天晚上风向
@property(nonatomic, strong) NSString *daily_windDirNight;
///预测当天晚上风力等级
@property(nonatomic, strong) NSString *daily_windScaleNight;
///预测当天晚上风速
@property(nonatomic, strong) NSString *daily_windSpeedNight;
///预测当天预测当天总降水量
@property(nonatomic, strong) NSString *daily_precip;
///预测当天紫外线强度指数
@property(nonatomic, strong) NSString *daily_uvIndex;
///预测当天相对湿度
@property(nonatomic, strong) NSString *daily_humidity;
///预测当天压强
@property(nonatomic, strong) NSString *daily_pressure;
///预测当天能见度
@property(nonatomic, strong) NSString *daily_vis;
///预测当天云量
@property(nonatomic, strong) NSString *daily_cloud;
///模型化24小时天气数据
- (void)FutureSevenDayModelListItemData:(NSDictionary *)dictionary;


#pragma mark -空气质量
///更新时间
@property(nonatomic, strong) NSString *now_pubTime;
///空气质量指数
@property(nonatomic, strong) NSString *now_aqi;
///空气质量等级
@property(nonatomic, strong) NSString *now_level;
///空气质量级别
@property(nonatomic, strong) NSString *now_category;
///PM10
@property(nonatomic, strong) NSString *now_pm10;
///PM2.5
@property(nonatomic, strong) NSString *now_pm2p5;
///NO2
@property(nonatomic, strong) NSString *now_no2;
///SO2
@property(nonatomic, strong) NSString *now_so2;
///CO
@property(nonatomic, strong) NSString *now_co;
///O3
@property(nonatomic, strong) NSString *now_o3;
///空气质量模型化
- (void)AirQualityModelListItemData:(NSDictionary *)dictionary;


#pragma mark -生活指数
///时间
@property(nonatomic, strong) NSString *date;
///类型编号
@property(nonatomic, strong) NSString *type;
///类型
@property(nonatomic, strong) NSString *name;
///描述
//@property(nonatomic, strong) NSString *text;
///等级
@property(nonatomic, strong) NSString *level;
///感觉
@property(nonatomic, strong) NSString *category;
///生活指数模型化
- (void)LivingModelListItemData:(NSDictionary *)dictionary;


#pragma mark -生活资讯

///博客内容
@property(nonatomic,copy,readwrite)NSString *created_at;//发博时间
@property(nonatomic,copy,readwrite)NSString *source;//来源
@property(nonatomic,copy,readwrite)NSString *text;//微博内容
@property(nonatomic,copy,readwrite)NSString *text_raw;//微博内容1
@property(nonatomic,copy,readwrite)NSString *thumbnail_pic;//缩略图url
@property(nonatomic,copy,readwrite)NSString *bmiddle_pic;//中尺寸图片url
@property(nonatomic,copy,readwrite)NSString *original_pic;//原图url
@property(nonatomic,copy,readwrite)NSNumber *reposts_count;//转发数
@property(nonatomic,copy,readwrite)NSNumber *comments_count;//评论数
@property(nonatomic,copy,readwrite)NSNumber *attitudes_count;//表态数
@property(nonatomic,copy,readwrite)NSNumber *ID;//用户ID
@property(nonatomic,copy,readwrite)NSArray *pic_urls;//图片数组

///用户信息
@property(nonatomic,copy,readwrite)NSString *screen_name;//用户昵称
@property(nonatomic,copy,readwrite)NSString *location;//用户位置
@property(nonatomic,copy,readwrite)NSString *describe;//用户描述
@property(nonatomic,copy,readwrite)NSString *profile_image_url;//用户头像图片url
@property(nonatomic,copy,readwrite)NSString *gender;//用户性别
@property(nonatomic,copy,readwrite)NSNumber *followers_count;//粉丝数
@property(nonatomic,copy,readwrite)NSNumber *friends_count;//关注数
@property(nonatomic,copy,readwrite)NSNumber *statuses_count;//微博数
@property(nonatomic,copy,readwrite)NSNumber *favourites_count;//收藏数
@property(nonatomic,copy,readwrite)NSString *created_atuser;//用户注册时间
@property(nonatomic,copy,readwrite)NSString *verified;//是否为V
@property(nonatomic,copy,readwrite)NSString *uid;//是否为V

///评论信息
@property(nonatomic,copy,readwrite)NSString *COMscreen_name;//用户昵称
@property(nonatomic,copy,readwrite)NSString *COMprofile_image_url;//用户头像图片url
@property(nonatomic,copy,readwrite)NSString *COMverified;//是否为V
@property(nonatomic,copy,readwrite)NSString *COMtext;//评论内容
@property(nonatomic,copy,readwrite)NSString *COMcreated_at;//评论时间
@property(nonatomic,copy,readwrite)NSString *COMsource;//来源
@property(nonatomic,copy,readwrite)NSString *COMtext_raw;//评论内容

- (void)WeiboconfigWithDictionary:(NSDictionary *)dictionary;

- (void)CommentconfigwithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
