//
//  RainFallView.m
//  Weather
//
//  Created by 邓杰 on 2022/8/15.
//

#import "RainFallView.h"

@implementation RainFallView

- (void)LoadRainFallView{
    
    //title
    _title = [[UILabel alloc] init];
    _title.text = @"降雨";
    CGFloat title_X = 20;
    CGFloat title_Y = 10;
    CGFloat title_Width = 100;
    CGFloat title_Height = 20;
    [_title setFrame:CGRectMake(title_X, title_Y, title_Width, title_Height)];
    _title.textAlignment = NSTextAlignmentLeft;
    _title.font =  [UIFont systemFontOfSize:18.0];
    [self addSubview:_title];
    
    //降雨量
    _IconRainFall = [[UIImageView alloc] init];
    [_IconRainFall setImage:[UIImage imageNamed:@"雨"]];
    CGFloat IconRainFall_X = title_X;
    CGFloat IconRainFall_Y = title_Y + title_Height + 10;
    CGFloat IconRainFall_Width = 60;
    CGFloat IconRainFall_Height = 60;
    [_IconRainFall setFrame:CGRectMake(IconRainFall_X, IconRainFall_Y, IconRainFall_Width, IconRainFall_Height)];
    [self addSubview:_IconRainFall];
    
    _RainFall = [[UILabel alloc] init];
    _RainFall.text = @"10毫米";
    _RainFall.textAlignment = NSTextAlignmentLeft;
    CGFloat RainFall_X = IconRainFall_X + IconRainFall_Width + 25;
    CGFloat RainFall_Y = IconRainFall_Y;
    CGFloat RainFall_Width = 150;
    CGFloat RainFall_Height = IconRainFall_Height;
    [_RainFall setFrame:CGRectMake(RainFall_X, RainFall_Y, RainFall_Width, RainFall_Height)];
    _RainFall.font = [UIFont boldSystemFontOfSize:28];
    [self addSubview:_RainFall];
    
    //相对湿度
    _IconHumidity = [[UIImageView alloc] init];
    [_IconHumidity setImage:[UIImage imageNamed:@"相对湿度"]];
    CGFloat IconHumidity_X = IconRainFall_X;
    CGFloat IconHumidity_Y = IconRainFall_Y + IconRainFall_Height + 20;
    CGFloat IconHumidity_Width = 40;
    CGFloat IconHumidity_Height = 40;
    [_IconHumidity setFrame:CGRectMake(IconHumidity_X, IconHumidity_Y, IconHumidity_Width, IconHumidity_Height)];
    [self addSubview:_IconHumidity];
    
    _Humidity = [[UILabel alloc] init];
    _Humidity.text = @"72%";
    CGFloat Humidity_X = IconHumidity_X + IconHumidity_Width +10;
    CGFloat Humidity_Y = IconHumidity_Y;
    CGFloat Humidity_Width = 100;
    CGFloat Humidity_Height = 20;
    [_Humidity setFrame:CGRectMake(Humidity_X, Humidity_Y, Humidity_Width, Humidity_Height)];
    _Humidity.font = [UIFont systemFontOfSize:15.0];
    [self addSubview:_Humidity];
    
    _HumidityLabel = [[UILabel alloc] init];
    _HumidityLabel.text = @"相对湿度";
    CGFloat HumidityLabel_X = IconHumidity_X + IconHumidity_Width +10;
    CGFloat HumidityLabel_Y = IconHumidity_Y + 20;
    CGFloat HumidityLabel_Width = 100;
    CGFloat HumidityLabel_Height = 20;
    [_HumidityLabel setFrame:CGRectMake(HumidityLabel_X, HumidityLabel_Y, HumidityLabel_Width, HumidityLabel_Height)];
    _HumidityLabel.font = [UIFont systemFontOfSize:15.0];
    [self addSubview:_HumidityLabel];
    
    
    //降雨概率
    _IconRainRate = [[UIImageView alloc] init];
    [_IconRainRate setImage:[UIImage imageNamed:@"降雨概率"]];
    CGFloat IconRainRate_X = 200;
    CGFloat IconRainRate_Y = IconRainFall_Y + IconRainFall_Height + 20;
    CGFloat IconRainRate_Width = 40;
    CGFloat IconRainRate_Height = 40;
    [_IconRainRate setFrame:CGRectMake(IconRainRate_X, IconRainRate_Y, IconRainRate_Width, IconRainRate_Height)];
    [self addSubview:_IconRainRate];
    
    _RainRate = [[UILabel alloc] init];
    _RainRate.text = @"18%";
    CGFloat RainRate_X = IconRainRate_X + IconRainRate_Width +10;
    CGFloat RainRate_Y = IconRainRate_Y;
    CGFloat RainRate_Width = 100;
    CGFloat RainRate_Height = 20;
    [_RainRate setFrame:CGRectMake(RainRate_X, RainRate_Y, RainRate_Width, RainRate_Height)];
    [_RainRate setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_RainRate];
    
    _RainRateLable = [[UILabel alloc] init];
    _RainRateLable.text = @"降雨概率";
    CGFloat RainRateLable_X = RainRate_X;
    CGFloat RainRateLable_Y = RainRate_Y + 20;
    CGFloat RainRateLable_Width = 100;
    CGFloat RainRateLable_Height = 20;
    [_RainRateLable setFrame:CGRectMake(RainRateLable_X, RainRateLable_Y, RainRateLable_Width, RainRateLable_Height)];
    [_RainRateLable setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_RainRateLable];
    
    
    //露点温度
    _IconDew = [[UIImageView alloc] init];
    [_IconDew setImage:[UIImage imageNamed:@"露点温度"]];
    CGFloat IconDew_X = IconHumidity_X;
    CGFloat IconDew_Y = IconHumidity_Y + IconHumidity_Height +20;
    CGFloat IconDew_Width = IconHumidity_Width;
    CGFloat IconDew_Height = IconHumidity_Height;
    [_IconDew setFrame:CGRectMake(IconDew_X, IconDew_Y, IconDew_Width, IconDew_Height)];
    [self addSubview:_IconDew];

    _Dew = [[UILabel alloc] init];
    _Dew.text = @"24°";
    CGFloat Dew_X = Humidity_X;
    CGFloat Dew_Y = IconDew_Y;
    CGFloat Dew_Width = Humidity_Width;
    CGFloat Dew_Height = Humidity_Height;
    [_Dew setFrame:CGRectMake(Dew_X, Dew_Y, Dew_Width, Dew_Height)];
    [_Dew setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_Dew];
    
    _DewLable = [[UILabel alloc] init];
    _DewLable.text = @"露点温度";
    CGFloat DewLable_X = Humidity_X;
    CGFloat DewLable_Y = IconDew_Y + 20;
    CGFloat DewLable_Width = Humidity_Width;
    CGFloat DewLable_Height = Humidity_Height;
    [_DewLable setFrame:CGRectMake(DewLable_X, DewLable_Y, DewLable_Width, DewLable_Height)];
    [_DewLable setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_DewLable];
    
    
    //云量
    _IconCloudCover = [[UIImageView alloc] init];
    [_IconCloudCover setImage:[UIImage imageNamed:@"云量"]];
    CGFloat IconCloudCover_X = IconRainRate_X;
    CGFloat IconCloudCover_Y = IconDew_Y;
    CGFloat IconCloudCover_Width = IconHumidity_Width;
    CGFloat IconCloudCover_Height = IconHumidity_Height;
    [_IconCloudCover setFrame:CGRectMake(IconCloudCover_X, IconCloudCover_Y, IconCloudCover_Width, IconCloudCover_Height)];
    [self addSubview:_IconCloudCover];
    
    _CloudCover = [[UILabel alloc] init];
    _CloudCover.text = @"35%";
    CGFloat CloudCover_X = RainRate_X;
    CGFloat CloudCover_Y = Dew_Y;
    CGFloat CloudCover_Width = Humidity_Width;
    CGFloat CloudCover_Height = Humidity_Height;
    [_CloudCover setFrame:CGRectMake(CloudCover_X, CloudCover_Y, CloudCover_Width, CloudCover_Height)];
    [_CloudCover setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_CloudCover];
    
    _CloudCoverLabel = [[UILabel alloc] init];
    _CloudCoverLabel.text = @"云量";
    CGFloat CloudCoverLabel_X = RainRateLable_X;
    CGFloat CloudCoverLabel_Y = DewLable_Y;
    CGFloat CloudCoverLabel_Width = Humidity_Width;
    CGFloat CloudCoverLabel_Height = Humidity_Height;
    [_CloudCoverLabel setFrame:CGRectMake(CloudCoverLabel_X, CloudCoverLabel_Y, CloudCoverLabel_Width, CloudCoverLabel_Height)];
    [_CloudCoverLabel setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_CloudCoverLabel];
    
    
    
}














@end
