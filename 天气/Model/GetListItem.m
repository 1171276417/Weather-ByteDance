//
//  GetListItem.m
//  Weather
//
//  Created by 邓杰 on 2022/8/12.
//

#import "GetListItem.h"

@implementation GetListItem

///模型化实时天气数据
- (void)RealTimeModelListItemData:(NSDictionary *)dictionary{
    
    _obsTime = [dictionary objectForKey:@"obsTime"];
    _now_temperature = [dictionary objectForKey:@"temp"];
    _now_feelsLike = [dictionary objectForKey:@"feelsLike"];
    _now_icon = [dictionary objectForKey:@"icon"];
    _now_describe = [dictionary objectForKey:@"text"];
    _now_wind360 = [dictionary objectForKey:@"wind360"];
    _now_windDirection = [dictionary objectForKey:@"windDir"];
    _now_windScale = [dictionary objectForKey:@"windScale"];
    _now_windSpeed = [dictionary objectForKey:@"windSpeed"];
    _now_humidity = [dictionary objectForKey:@"humidity"];
    _now_precip = [dictionary objectForKey:@"precip"];
    _now_pressurep = [dictionary objectForKey:@"pressure"];
    _now_vis = [dictionary objectForKey:@"vis"];
    _now_cloud = [dictionary objectForKey:@"cloud"];
    _now_dew = [dictionary objectForKey:@"dewd"];
    
}


///模型化24小时天气数据
- (void)FutureOneDayModelListItemData:(NSDictionary *)dictionary{

    _hourly_fxTime = [dictionary objectForKey:@"fxTime"];
    _hourly_temperature = [dictionary objectForKey:@"temp"];
    _hourly_icon = [dictionary objectForKey:@"icon"];
    _hourly_describe = [dictionary objectForKey:@"text"];
    _hourly_wind360 = [dictionary objectForKey:@"wind360"];
    _hourly_windDirection = [dictionary objectForKey:@"windDir"];
    _hourly_windScale = [dictionary objectForKey:@"windScale"];
    _hourly_windSpeed = [dictionary objectForKey:@"windSpeed"];
    _hourly_humidity = [dictionary objectForKey:@"humidity"];
    _hourly_pop = [dictionary objectForKey:@"pop"];
    _hourly_precip = [dictionary objectForKey:@"precip"];
    _hourly_pressure = [dictionary objectForKey:@"pressure"];
    _hourly_cloud = [dictionary objectForKey:@"cloud"];
    _hourly_dew = [dictionary objectForKey:@"dew"];

}

//模型化7天天气数据
- (void)FutureSevenDayModelListItemData:(NSDictionary *)dictionary{
    
    _daily_fxDate = [dictionary objectForKey:@"fxDate"];
    _daily_sunrise = [dictionary objectForKey:@"sunrise"];
    _daily_sunset = [dictionary objectForKey:@"sunset"];
    _daily_moonrise = [dictionary objectForKey:@"moonrise"];
    _daily_moonset = [dictionary objectForKey:@"moonset"];
    _daily_moonPhase = [dictionary objectForKey:@"moonPhase"];
    _daily_moonPhaseIcon = [dictionary objectForKey:@"moonPhaseIcon"];
    _daily_tempMax = [dictionary objectForKey:@"tempMax"];
    _daily_tempMin = [dictionary objectForKey:@"tempMin"];
    _daily_iconDay = [dictionary objectForKey:@"iconDay"];
    _daily_describeDay = [dictionary objectForKey:@"textDay"];
    _daily_iconNight = [dictionary objectForKey:@"iconNight"];
    _daily_describeNight = [dictionary objectForKey:@"textNight"];
    _daily_wind360Day = [dictionary objectForKey:@"wind360Day"];
    _daily_windDirDay = [dictionary objectForKey:@"windDirDay"];
    _daily_windScaleDay = [dictionary objectForKey:@"windScaleDay"];
    _daily_windSpeedDay = [dictionary objectForKey:@"windSpeedDay"];
    _daily_wind360Night = [dictionary objectForKey:@"wind360Night"];
    _daily_windDirNight = [dictionary objectForKey:@"windDirNight"];
    _daily_windScaleNight = [dictionary objectForKey:@"windScaleNight"];
    _daily_windSpeedNight = [dictionary objectForKey:@"windSpeedNight"];
    _daily_precip = [dictionary objectForKey:@"precip"];
    _daily_uvIndex = [dictionary objectForKey:@"uvIndex"];
    _daily_humidity = [dictionary objectForKey:@"humidity"];
    _daily_pressure = [dictionary objectForKey:@"pressure"];
    _daily_vis = [dictionary objectForKey:@"vis"];
    _daily_cloud = [dictionary objectForKey:@"cloud"];

}

//空气质量数据
- (void)AirQualityModelListItemData:(NSDictionary *)dictionary{
    _now_pubTime = [dictionary objectForKey:@"pubTime"];
    _now_aqi = [dictionary objectForKey:@"aqi"];
    _now_level = [dictionary objectForKey:@"level"];
    _now_category = [dictionary objectForKey:@"category"];
    _now_pm10 = [dictionary objectForKey:@"pm10"];
    _now_pm2p5 = [dictionary objectForKey:@"pm2p5"];
    _now_co = [dictionary objectForKey:@"co"];
    _now_so2 = [dictionary objectForKey:@"so2"];
    _now_no2 = [dictionary objectForKey:@"no2"];
    _now_o3 = [dictionary objectForKey:@"o3"];

    
    
    
    
    
    
    
}





@end
