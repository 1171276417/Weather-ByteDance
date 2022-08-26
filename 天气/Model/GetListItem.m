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

///模型化7天天气数据
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

///空气质量数据
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

///生活指数
- (void)LivingModelListItemData:(NSDictionary *)dictionary{
    _date = [dictionary objectForKey:@"date"];
    _type = [dictionary objectForKey:@"type"];
    _name = [dictionary objectForKey:@"name"];
    _text = [dictionary objectForKey:@"text"];
    _level = [dictionary objectForKey:@"level"];
    _category = [dictionary objectForKey:@"category"]; 
}


///生活资讯
- (void)WeiboconfigWithDictionary:(NSDictionary *)dictionary{
    /**微博内容信息*/
    self.created_at=[dictionary objectForKey:@"created_at"];
    self.source=[dictionary objectForKey:@"source"];
    self.text=[dictionary objectForKey:@"text"];
    self.text_raw=[dictionary objectForKey:@"text_raw"];

    self.thumbnail_pic=[dictionary objectForKey:@"thumbnail_pic"];
    self.bmiddle_pic=[dictionary objectForKey:@"bmiddle_pic"];
    self.original_pic=[dictionary objectForKey:@"original_pic"];
    self.reposts_count=[dictionary objectForKey:@"reposts_count"];
    self.comments_count=[dictionary objectForKey:@"comments_count"];
    self.attitudes_count=[dictionary objectForKey:@"attitudes_count"];
    self.ID=[dictionary objectForKey:@"id"];
    self.pic_urls=[dictionary objectForKey:@"pic_urls"];
    /**用户信息*/
    self.screen_name=[[dictionary objectForKey:@"user"] objectForKey:@"screen_name"];
    self.location=[[dictionary objectForKey:@"user"] objectForKey:@"location"];
    self.describe=[[dictionary objectForKey:@"user"] objectForKey:@"description"];
    self.profile_image_url=[[dictionary objectForKey:@"user"] objectForKey:@"profile_image_url"];
    self.gender=[[dictionary objectForKey:@"user"] objectForKey:@"gender"];
    self.followers_count=[[dictionary objectForKey:@"user"] objectForKey:@"followers_count"];
    self.friends_count=[[dictionary objectForKey:@"user"] objectForKey:@"friends_count"];
    self.statuses_count=[[dictionary objectForKey:@"user"] objectForKey:@"statuses_count"];
    self.favourites_count=[[dictionary objectForKey:@"user"] objectForKey:@"favourites_count"];
    self.created_atuser=[[dictionary objectForKey:@"user"] objectForKey:@"created_atuser"];
    self.verified=[[dictionary objectForKey:@"user"] objectForKey:@"verified"];
    self.uid=[[dictionary objectForKey:@"user"] objectForKey:@"id"];

}
///微博评论转模型
- (void)CommentconfigwithDictionary:(NSDictionary *)dictionary{
    /**评论信息*/
    self.COMprofile_image_url=[[dictionary objectForKey:@"user"] objectForKey:@"profile_image_url"];
    self.COMscreen_name=[[dictionary objectForKey:@"user"] objectForKey:@"screen_name"];
    self.COMcreated_at=[dictionary objectForKey:@"created_at"];
    self.COMsource=[dictionary objectForKey:@"source"];
    self.COMtext=[dictionary objectForKey:@"text"];
    self.COMtext_raw=[dictionary objectForKey:@"text_raw"];
}


///编码
- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.obsTime forKey:@"obsTime"];
    [coder encodeObject:self.now_temperature forKey:@"now_temperature"];
    [coder encodeObject:self.now_feelsLike forKey:@"now_feelsLike"];
    [coder encodeObject:self.now_icon forKey:@"now_icon"];
    [coder encodeObject:self.now_describe forKey:@"now_describe"];
    [coder encodeObject:self.now_wind360 forKey:@"now_wind360"];
    [coder encodeObject:self.now_windDirection forKey:@"now_windDirection"];
    [coder encodeObject:self.now_windScale forKey:@"now_windScale"];
    [coder encodeObject:self.now_windSpeed forKey:@"now_windSpeed"];
    [coder encodeObject:self.now_humidity forKey:@"now_humidity"];
    [coder encodeObject:self.now_precip forKey:@"now_precip"];
    [coder encodeObject:self.now_pressurep forKey:@"now_pressurep"];
    [coder encodeObject:self.now_vis forKey:@"now_vis"];
    [coder encodeObject:self.now_cloud forKey:@"now_cloud"];
    [coder encodeObject:self.now_dew forKey:@"now_dew"];
    [coder encodeObject:self.hourly_fxTime forKey:@"hourly_fxTime"];
    [coder encodeObject:self.hourly_temperature forKey:@"hourly_temperature"];
    [coder encodeObject:self.hourly_icon forKey:@"hourly_icon"];
    [coder encodeObject:self.hourly_describe forKey:@"hourly_describe"];
    [coder encodeObject:self.hourly_wind360 forKey:@"hourly_wind360"];
    [coder encodeObject:self.hourly_windDirection forKey:@"hourly_windDirection"];
    [coder encodeObject:self.hourly_humidity forKey:@"hourly_humidity"];
    [coder encodeObject:self.hourly_precip forKey:@"hourly_precip"];
    [coder encodeObject:self.hourly_pop forKey:@"hourly_pop"];
    [coder encodeObject:self.hourly_pressure forKey:@"hourly_pressure"];
    [coder encodeObject:self.hourly_cloud forKey:@"hourly_cloud"];
    [coder encodeObject:self.hourly_dew forKey:@"hourly_dew"];
    [coder encodeObject:self.daily_fxDate forKey:@"daily_fxDate"];
    [coder encodeObject:self.daily_sunrise forKey:@"daily_sunrise"];
    [coder encodeObject:self.daily_sunset forKey:@"daily_sunset"];
    [coder encodeObject:self.daily_moonrise forKey:@"daily_moonrise"];
    [coder encodeObject:self.daily_moonset forKey:@"daily_moonset"];
    [coder encodeObject:self.daily_moonPhase forKey:@"daily_moonPhase"];
    [coder encodeObject:self.daily_moonPhaseIcon forKey:@"daily_moonPhaseIcon"];
    [coder encodeObject:self.daily_tempMax forKey:@"daily_tempMax"];
    [coder encodeObject:self.daily_tempMin forKey:@"daily_tempMin"];
    [coder encodeObject:self.daily_iconDay forKey:@"daily_iconDay"];
    [coder encodeObject:self.daily_describeDay forKey:@"daily_describeDay"];
    [coder encodeObject:self.daily_iconNight forKey:@"daily_iconNight"];
    [coder encodeObject:self.daily_describeNight forKey:@"daily_describeNight"];
    [coder encodeObject:self.daily_wind360Day forKey:@"daily_wind360Day"];
    [coder encodeObject:self.daily_windDirDay forKey:@"daily_windDirDay"];
    [coder encodeObject:self.daily_windScaleDay forKey:@"daily_windScaleDay"];
    [coder encodeObject:self.daily_windSpeedDay forKey:@"daily_windSpeedDay"];
    [coder encodeObject:self.daily_wind360Night forKey:@"daily_wind360Night"];
    [coder encodeObject:self.daily_windDirNight forKey:@"daily_windDirNight"];
    [coder encodeObject:self.daily_windScaleNight forKey:@"daily_windScaleNight"];
    [coder encodeObject:self.daily_windSpeedNight forKey:@"daily_windSpeedNight"];
    [coder encodeObject:self.daily_precip forKey:@"daily_precip"];
    [coder encodeObject:self.daily_uvIndex forKey:@"daily_uvIndex"];
    [coder encodeObject:self.daily_humidity forKey:@"daily_humidity"];
    [coder encodeObject:self.daily_pressure forKey:@"daily_pressure"];
    [coder encodeObject:self.daily_vis forKey:@"daily_vis"];
    [coder encodeObject:self.daily_cloud forKey:@"daily_cloud"];
    [coder encodeObject:self.now_pubTime forKey:@"now_pubTime"];
    [coder encodeObject:self.now_aqi forKey:@"now_aqi"];
    [coder encodeObject:self.now_level forKey:@"now_level"];
    [coder encodeObject:self.now_category forKey:@"now_category"];
    [coder encodeObject:self.now_pm10 forKey:@"now_pm10"];
    [coder encodeObject:self.now_pm2p5 forKey:@"now_pm2p5"];
    [coder encodeObject:self.now_no2 forKey:@"now_no2"];
    [coder encodeObject:self.now_so2 forKey:@"now_so2"];
    [coder encodeObject:self.now_co forKey:@"now_co"];
    [coder encodeObject:self.now_o3 forKey:@"now_o3"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.type forKey:@"type"];
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.text forKey:@"text"];
    [coder encodeObject:self.level forKey:@"level"];
    [coder encodeObject:self.now_o3 forKey:@"category"];

}

///解码
- (id)initWithCoder:(NSCoder *)coder{
    self.obsTime = [coder decodeObjectForKey:@"obsTime"];
    self.now_temperature = [coder decodeObjectForKey:@"now_temperature"];
    self.now_feelsLike = [coder decodeObjectForKey:@"now_feelsLike"];
    self.now_icon = [coder decodeObjectForKey:@"now_icon"];
    self.now_describe = [coder decodeObjectForKey:@"now_describe"];
    self.now_wind360 = [coder decodeObjectForKey:@"now_wind360"];
    self.now_windDirection = [coder decodeObjectForKey:@"now_windDirection"];
    self.now_windScale = [coder decodeObjectForKey:@"now_windScale"];
    self.now_windSpeed = [coder decodeObjectForKey:@"now_windSpeed"];
    self.now_humidity = [coder decodeObjectForKey:@"now_humidity"];
    self.now_precip = [coder decodeObjectForKey:@"now_precip"];
    self.now_pressurep = [coder decodeObjectForKey:@"now_pressurep"];
    self.now_vis = [coder decodeObjectForKey:@"now_vis"];
    self.now_cloud = [coder decodeObjectForKey:@"now_cloud"];
    self.now_dew = [coder decodeObjectForKey:@"now_dew"];
    self.hourly_fxTime = [coder decodeObjectForKey:@"hourly_fxTime"];
    self.hourly_temperature = [coder decodeObjectForKey:@"hourly_temperature"];
    self.hourly_icon = [coder decodeObjectForKey:@"hourly_icon"];
    self.hourly_describe = [coder decodeObjectForKey:@"hourly_describe"];
    self.hourly_wind360 = [coder decodeObjectForKey:@"hourly_wind360"];
    self.hourly_windDirection = [coder decodeObjectForKey:@"hourly_windDirection"];
    self.hourly_windScale = [coder decodeObjectForKey:@"hourly_windScale"];
    self.hourly_windSpeed = [coder decodeObjectForKey:@"hourly_windSpeed"];
    self.hourly_humidity = [coder decodeObjectForKey:@"hourly_humidity"];
    self.hourly_precip = [coder decodeObjectForKey:@"hourly_precip"];
    self.hourly_pop = [coder decodeObjectForKey:@"hourly_pop"];
    self.hourly_pressure = [coder decodeObjectForKey:@"hourly_pressure"];
    self.hourly_cloud = [coder decodeObjectForKey:@"hourly_cloud"];
    self.hourly_dew = [coder decodeObjectForKey:@"hourly_dew"];
    self.daily_fxDate = [coder decodeObjectForKey:@"daily_fxDate"];
    self.daily_sunrise = [coder decodeObjectForKey:@"daily_sunrise"];
    self.daily_sunset = [coder decodeObjectForKey:@"daily_sunset"];
    self.daily_moonrise = [coder decodeObjectForKey:@"daily_moonrise"];
    self.daily_moonset = [coder decodeObjectForKey:@"daily_moonset"];
    self.daily_moonPhase = [coder decodeObjectForKey:@"daily_moonPhase"];
    self.daily_moonPhaseIcon = [coder decodeObjectForKey:@"daily_moonPhaseIcon"];
    self.daily_tempMax = [coder decodeObjectForKey:@"daily_tempMax"];
    self.daily_tempMin = [coder decodeObjectForKey:@"daily_tempMin"];
    self.daily_iconDay = [coder decodeObjectForKey:@"daily_iconDay"];
    self.daily_describeDay = [coder decodeObjectForKey:@"daily_describeDay"];
    self.daily_iconNight = [coder decodeObjectForKey:@"daily_iconNight"];
    self.daily_describeNight = [coder decodeObjectForKey:@"daily_describeNight"];
    self.daily_wind360Day = [coder decodeObjectForKey:@"daily_wind360Day"];
    self.daily_windDirDay = [coder decodeObjectForKey:@"daily_windDirDay"];
    self.daily_windScaleDay = [coder decodeObjectForKey:@"daily_windScaleDay"];
    self.daily_windSpeedDay = [coder decodeObjectForKey:@"daily_windSpeedDay"];
    self.daily_wind360Night = [coder decodeObjectForKey:@"daily_wind360Night"];
    self.daily_windDirNight = [coder decodeObjectForKey:@"daily_windDirNight"];
    self.daily_windScaleNight = [coder decodeObjectForKey:@"daily_windScaleNight"];
    self.daily_windSpeedNight = [coder decodeObjectForKey:@"daily_windSpeedNight"];
    self.daily_precip = [coder decodeObjectForKey:@"daily_precip"];
    self.daily_uvIndex = [coder decodeObjectForKey:@"daily_uvIndex"];
    self.daily_humidity = [coder decodeObjectForKey:@"daily_humidity"];
    self.daily_pressure = [coder decodeObjectForKey:@"daily_pressure"];
    self.daily_vis = [coder decodeObjectForKey:@"daily_vis"];
    self.daily_cloud = [coder decodeObjectForKey:@"daily_cloud"];
    self.now_pubTime = [coder decodeObjectForKey:@"now_pubTime"];
    self.now_aqi = [coder decodeObjectForKey:@"now_aqi"];
    self.now_level = [coder decodeObjectForKey:@"now_level"];
    self.now_category = [coder decodeObjectForKey:@"now_category"];
    self.now_pm10 = [coder decodeObjectForKey:@"now_pm10"];
    self.now_pm2p5 = [coder decodeObjectForKey:@"now_pm2p5"];
    self.now_no2 = [coder decodeObjectForKey:@"now_no2"];
    self.now_so2 = [coder decodeObjectForKey:@"now_so2"];
    self.now_co = [coder decodeObjectForKey:@"now_co"];
    self.now_o3 = [coder decodeObjectForKey:@"now_o3"];
    self.date = [coder decodeObjectForKey:@"date"];
    self.type = [coder decodeObjectForKey:@"type"];
    self.name = [coder decodeObjectForKey:@"name"];
    self.text = [coder decodeObjectForKey:@"text"];
    self.level = [coder decodeObjectForKey:@"level"];
    self.category = [coder decodeObjectForKey:@"category"];

    return self;
}

@end

