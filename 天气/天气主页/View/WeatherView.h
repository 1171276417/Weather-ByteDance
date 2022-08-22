//
//  WeatherView.h
//  Weather
//
//  Created by 邓杰 on 2022/8/12.
//

#import <UIKit/UIKit.h>
#import "ScreenFrame.h"
#import "RainFallView.h"
#import "AirQualityView.h"
#import "WindView.h"
#import "FeelsLikeView.h"
#import "UvIndexView.h"
#import "VisView.h"


NS_ASSUME_NONNULL_BEGIN

@interface WeatherView : UIView

@property(nonatomic, strong) UIButton *btnLocation;
@property(nonatomic, strong) UIButton *btnAdd;

///当前天气信息的view
@property(nonatomic, strong) UIScrollView *weatherScroller;
///城市名
@property(nonatomic ,strong) UILabel *cityname;
///温度
@property(nonatomic, strong) UILabel *temperature;
///天气描述（如：晴、雨、阴）
@property(nonatomic, strong) UILabel *describe;
///最高最低温度
@property(nonatomic, strong) UILabel *temperaureMaxAndMin;
///24小时实时温度
@property(nonatomic, strong) UITableView *OneDaytableView;
///未来七天温度
@property(nonatomic, strong)UITableView *SevenDayTemperaure;

///降雨View
@property(nonatomic, strong)RainFallView *rainFallView;
///空气质量View
@property(nonatomic, strong)AirQualityView *airQualityView;
///风力View
@property(nonatomic, strong)WindView *windView;
///体感温度View
@property(nonatomic, strong)FeelsLikeView *feelsLikeView;
///紫外线View
@property(nonatomic, strong)UvIndexView *uvIndexView;
///能见度
@property(nonatomic, strong)VisView *visView;


- (void)LoadWeatherView;

@end

NS_ASSUME_NONNULL_END
