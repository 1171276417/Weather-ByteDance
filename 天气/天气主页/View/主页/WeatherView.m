//
//  WeatherView.m
//  Weather
//
//  Created by 邓杰 on 2022/8/12.
//

#import "WeatherView.h"

@implementation WeatherView

- (void)LoadWeatherView{
    
    self.backgroundColor = [UIColor grayColor];
    
    UIImageView *back = [[UIImageView alloc] init];
    [back setImage:[UIImage imageNamed:@"background1"]];
    [back setFrame:CGRectMake(0, -50, SCREEN_WIDTH, SCREEN_HEIGHT+50)];
    [self addSubview:back];
    
    
    _weatherScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _weatherScroller.contentSize = CGSizeMake(0 , SCREEN_HEIGHT*2 );
    [self addSubview:_weatherScroller];
    _weatherScroller.pagingEnabled = NO;
    _weatherScroller.showsVerticalScrollIndicator = NO;
    _weatherScroller.showsHorizontalScrollIndicator = NO;
    _weatherScroller.bounces = NO;
    
    /**地区名*/
    _cityname = [[UILabel alloc] init];
    [_cityname setFrame:CGRectMake(SCREEN_WIDTH/2-180, 50, 360, 50)];
//    _cityname.text = @"广州市";
    _cityname.textColor = [UIColor blackColor];
    _cityname.font = [UIFont systemFontOfSize:25];
    _cityname.textAlignment = NSTextAlignmentCenter;
    _cityname.textColor = [UIColor whiteColor];
    [_weatherScroller addSubview:_cityname];
    /**温度数值*/
    _temperature = [[UILabel alloc] init];
    [_temperature setFrame:CGRectMake(SCREEN_WIDTH/2-70, 100, 160, 100)];
//    _temperature.text = @"32°";
    _temperature.textColor = [UIColor blackColor];
    _temperature.font = [UIFont systemFontOfSize:80];
    _temperature.textAlignment = NSTextAlignmentCenter;
    _temperature.textColor = [UIColor whiteColor];
    [_weatherScroller addSubview:_temperature];
    /**天气描述*/
    _describe = [[UILabel alloc] init];
    [_describe setFrame:CGRectMake(SCREEN_WIDTH/2-100, 200, 200, 50)];
    _describe.textColor = [UIColor blackColor];
    _describe.font = [UIFont systemFontOfSize:20];
    _describe.textAlignment = NSTextAlignmentCenter;
    _describe.textColor = [UIColor whiteColor];
    [_weatherScroller addSubview:_describe];
    /**最高最低温度*/
    _temperaureMaxAndMin = [[UILabel alloc] init];
    [_temperaureMaxAndMin setFrame:CGRectMake(SCREEN_WIDTH/2-150, 250, 300, 50)];
    _temperaureMaxAndMin.textColor = [UIColor blackColor];
    _temperaureMaxAndMin.font = [UIFont systemFontOfSize:20];
    _temperaureMaxAndMin.textAlignment = NSTextAlignmentCenter;
    _temperaureMaxAndMin.textColor = [UIColor whiteColor];
    [_weatherScroller addSubview:_temperaureMaxAndMin];
    
    
    UIView *TabelViewBackgounrd = [[UIView alloc] init];
    TabelViewBackgounrd.backgroundColor = [UIColor whiteColor];
    TabelViewBackgounrd.alpha = 0.55;
    [TabelViewBackgounrd setFrame:CGRectMake(SCREEN_WIDTH/2 - 180, 300, 360, 470)];
    [_weatherScroller addSubview:TabelViewBackgounrd];
    
    /**实时温度*/
    _OneDaytableView = [[UITableView alloc] init];
    _OneDaytableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);    /**tableview逆时针旋转90度*/
    [_OneDaytableView setFrame:CGRectMake(SCREEN_WIDTH/2 - 180, 300, 360, 100)];
    _OneDaytableView.separatorStyle = UITableViewCellSeparatorStyleNone; //去分割线
    _OneDaytableView.showsVerticalScrollIndicator = NO;
    _OneDaytableView.showsHorizontalScrollIndicator = NO;
    [_OneDaytableView setBackgroundView:nil];
    [_OneDaytableView setBackgroundColor:[UIColor clearColor]];
    [_weatherScroller addSubview:_OneDaytableView];
    
    /**未来七天温度*/
    _SevenDayTemperaure = [[UITableView alloc] init];
    [_SevenDayTemperaure setFrame:CGRectMake(SCREEN_WIDTH/2 - 175, 400, 350, 350)];
    _SevenDayTemperaure.scrollEnabled = NO;
    _SevenDayTemperaure.showsVerticalScrollIndicator = NO;
    [_SevenDayTemperaure setBackgroundView:nil];
    [_SevenDayTemperaure setBackgroundColor:[UIColor clearColor]];
    [_weatherScroller addSubview:_SevenDayTemperaure];
    
    //降雨View
    UIView *RainBackgounrd = [[UIView alloc] init];
    RainBackgounrd.backgroundColor = [UIColor whiteColor];
    RainBackgounrd.alpha = 0.55;
    [RainBackgounrd setFrame:CGRectMake(SCREEN_WIDTH/2-180, 770, 360, 240)];
    [_weatherScroller addSubview:RainBackgounrd];
    
    _rainFallView = [[RainFallView alloc] init];
    [_rainFallView setFrame:CGRectMake(SCREEN_WIDTH/2-180, 770, 360, 240)];
    [_rainFallView LoadRainFallView];
    [_weatherScroller addSubview:_rainFallView];
    
    //空气质量
    UIView *AirQualityBackgound = [[UIView alloc] init];
    AirQualityBackgound.backgroundColor = [UIColor whiteColor];
    AirQualityBackgound.alpha = 0.55;
    [AirQualityBackgound setFrame:CGRectMake(SCREEN_WIDTH/2-180, 1030, 360, 210)];
    [_weatherScroller addSubview:AirQualityBackgound];
    
    _airQualityView = [[AirQualityView alloc] init];
    [_airQualityView setFrame:CGRectMake(SCREEN_WIDTH/2-180, 1030, 360, 210)];
    [_airQualityView LoadAirQualityView];
    [_weatherScroller addSubview:_airQualityView];
    
    
    //风向
    UIView *WindBackground = [[UIView alloc] init];
    WindBackground.backgroundColor = [UIColor whiteColor];
    WindBackground.alpha = 0.55;
    [WindBackground setFrame:CGRectMake(SCREEN_WIDTH/2-180, 1260, 172.5, 180)];
    [_weatherScroller addSubview:WindBackground];
    
    _windView = [[WindView alloc] init];
    [_windView setFrame:CGRectMake(SCREEN_WIDTH/2-180, 1260, 172.5, 180)];
    [_windView LoadWindView];
    [_weatherScroller addSubview:_windView];
    
    //体感温度
    UIView *FeelLikeView = [[UIView alloc] init];
    FeelLikeView.backgroundColor = [UIColor whiteColor];
    FeelLikeView.alpha = 0.55;
    [FeelLikeView setFrame:CGRectMake(SCREEN_WIDTH/2+7.5, 1260, 172.5, 180)];
    [_weatherScroller addSubview:FeelLikeView];
    
    _feelsLikeView = [[FeelsLikeView alloc] init];
    [_feelsLikeView setFrame:CGRectMake(SCREEN_WIDTH/2+7.5, 1260, 172.5, 180)];
    [_feelsLikeView LoadFeelsLikeView];
    [_weatherScroller addSubview:_feelsLikeView];
    
    //紫外线
    UIView *UvIndexview = [[UIView alloc] init];
    UvIndexview.backgroundColor = [UIColor whiteColor];
    [UvIndexview setAlpha:0.55];
    [UvIndexview setFrame:CGRectMake(SCREEN_WIDTH/2+7.5, 1460, 172.5, 180)];
    [_weatherScroller addSubview:UvIndexview];
    
    _uvIndexView = [[UvIndexView alloc] init];
    [_uvIndexView setFrame:CGRectMake(SCREEN_WIDTH/2+7.5, 1460, 172.5, 180)];
    [_uvIndexView LoadUvIndexView];
    [_weatherScroller addSubview:_uvIndexView];
    
    //能见度
    UIView *Visview = [[UIView alloc] init];
    [Visview setBackgroundColor:[UIColor whiteColor]];
    [Visview setAlpha:0.55];
    [Visview setFrame:CGRectMake(SCREEN_WIDTH/2-180, 1460, 172.5, 180)];
    [_weatherScroller addSubview:Visview];
    
    _visView = [[VisView alloc] init];
    [_visView setFrame:CGRectMake(SCREEN_WIDTH/2-180, 1460, 172.5, 180)];
    [_visView LoadVisView];
    [_weatherScroller addSubview:_visView];
    
    
    
    _btnLocation = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnLocation.frame = CGRectMake(20, 40, 30, 30);
    [_btnLocation setImage:[UIImage imageNamed:@"Location"] forState:UIControlStateNormal];
    [self addSubview:_btnLocation];
    
    _btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnAdd.frame = CGRectMake(390-50, 40, 30, 30);
    [_btnAdd setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [self addSubview:_btnAdd];
    
    
    _btnLink = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnLink.frame = CGRectMake(340, 160, 30, 30);
    [_btnLink setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [self addSubview:_btnLink];
    
    
}





@end
