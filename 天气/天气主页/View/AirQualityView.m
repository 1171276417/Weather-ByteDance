//
//  AirQualityView.m
//  Weather
//
//  Created by 邓杰 on 2022/8/15.
//

#import "AirQualityView.h"

@implementation AirQualityView

- (void)LoadAirQualityView{
    
    //title
    _title = [[UILabel alloc] init];
    _title.text = @"空气质量";
    CGFloat title_X = 20;
    CGFloat title_Y = 10;
    CGFloat title_Width = 100;
    CGFloat title_Height = 20;
    [_title setFrame:CGRectMake(title_X, title_Y, title_Width, title_Height)];
    _title.textAlignment = NSTextAlignmentLeft;
    _title.font = [UIFont systemFontOfSize:18.0];
    [self addSubview:_title];
    
    _AirGrade = [[UILabel alloc] init];
    _AirGrade.text = [[@"54" stringByAppendingString:@" - "] stringByAppendingString:@"良"];
    CGFloat AirGrade_X = 20;
    CGFloat AirGrade_Y = title_Y + title_Height +10;
    CGFloat AirGrade_Width = 100;
    CGFloat AirGrade_Height = 30;
    [_AirGrade setFrame:CGRectMake(AirGrade_X, AirGrade_Y, AirGrade_Width, AirGrade_Height)];
    _AirGrade.textAlignment = NSTextAlignmentLeft;
    [_AirGrade setFont:[UIFont boldSystemFontOfSize:25.0]];
    [self addSubview:_AirGrade];

    //PM2.5
    _IconPM25 = [[UIImageView alloc] init];
    [_IconPM25 setImage:[UIImage imageNamed:@"PM2.5"]];
    CGFloat IconPM25_X = 20;
    CGFloat IconPM25_Y = AirGrade_Y + AirGrade_Height + 20;
    CGFloat IconPM25_Width = 40;
    CGFloat IconPM25_Height = 40;
    [_IconPM25 setFrame:CGRectMake(IconPM25_X, IconPM25_Y, IconPM25_Width, IconPM25_Height)];
    [self addSubview:_IconPM25];

    _PM25 = [[UILabel alloc] init];
    [_PM25 setText:@"15"];
    CGFloat PM25_X = IconPM25_X + IconPM25_Width +5;
    CGFloat PM25_Y = IconPM25_Y;
    CGFloat PM25_Width = 100;
    CGFloat PM25_Height = 20;
    [_PM25 setFrame:CGRectMake(PM25_X, PM25_Y, PM25_Width, PM25_Height)];
    [_PM25 setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_PM25];
    
    _PM25Label = [[UILabel alloc] init];
    [_PM25Label setText:@"PM2.5"];
    CGFloat PM25Label_X = PM25_X;
    CGFloat PM25Label_Y = IconPM25_Y + 20;
    CGFloat PM25Label_Width = 100;
    CGFloat PM25Label_Height = 20;
    [_PM25Label setFrame:CGRectMake(PM25Label_X, PM25Label_Y, PM25Label_Width, PM25Label_Height)];
    [_PM25Label setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_PM25Label];
    
    //PM10
    _IconPM10 = [[UIImageView alloc] init];
    [_IconPM10 setImage:[UIImage imageNamed:@"PM10"]];
    CGFloat IconPM10_X = AirGrade_X + 120;
    CGFloat IconPM10_Y = AirGrade_Y + AirGrade_Height + 20;
    CGFloat IconPM10_Width = 40;
    CGFloat IconPM10_Height = 40;
    [_IconPM10 setFrame:CGRectMake(IconPM10_X, IconPM10_Y, IconPM10_Width, IconPM10_Height)];
    [self addSubview:_IconPM10];

    _PM10 = [[UILabel alloc] init];
    [_PM10 setText:@"34"];
    CGFloat PM10_X = IconPM10_X + IconPM10_Width + 5;
    CGFloat PM10_Y = IconPM25_Y;
    CGFloat PM10_Width = 100;
    CGFloat PM10_Height = 20;
    [_PM10 setFrame:CGRectMake(PM10_X, PM10_Y, PM10_Width, PM10_Height)];
    [_PM10 setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_PM10];

    _PM10Label = [[UILabel alloc] init];
    [_PM10Label setText:@"PM10"];
    CGFloat PM10Label_X = PM10_X;
    CGFloat PM10Label_Y = PM10_Y + 20;
    CGFloat PM10Label_Width = 100;
    CGFloat PM10Label_Height = 20;
    [_PM10Label setFrame:CGRectMake(PM10Label_X, PM10Label_Y, PM10Label_Width, PM10Label_Height)];
    [_PM10Label setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_PM10Label];
    
    //O3
    _IconO3 = [[UIImageView alloc] init];
    [_IconO3 setImage:[UIImage imageNamed:@"臭氧"]];
    CGFloat IconO3_X = AirGrade_X + 240;
    CGFloat IconO3_Y = IconPM25_Y;
    CGFloat IconO3_Width = 40;
    CGFloat IconO3_Height = 40;
    [_IconO3 setFrame:CGRectMake(IconO3_X, IconO3_Y, IconO3_Width, IconO3_Height)];
    [self addSubview:_IconO3];

    _O3 = [[UILabel alloc] init];
    [_O3 setText:@"54"];
    CGFloat O3_X = IconO3_X + IconO3_Width + 5;
    CGFloat O3_Y = IconO3_Y;
    CGFloat O3_Width = 100;
    CGFloat O3_Height = 20;
    [_O3 setFrame:CGRectMake(O3_X, O3_Y, O3_Width, O3_Height)];
    [_O3 setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_O3];

    _O3Label = [[UILabel alloc] init];
    [_O3Label setText:@"O3"];
    CGFloat O3Label_X = O3_X;
    CGFloat O3Label_Y = IconO3_Y + 20;
    CGFloat O3Label_Width = 100;
    CGFloat O3Label_Height = 20;
    [_O3Label setFrame:CGRectMake(O3Label_X, O3Label_Y, O3Label_Width, O3Label_Height)];
    [_O3Label setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_O3Label];
    
    
    //CO
    _IconCO = [[UIImageView alloc] init];
    [_IconCO setImage:[UIImage imageNamed:@"一氧化碳"]];
    CGFloat IconCO_X = 20;
    CGFloat IconCO_Y = IconPM25_Y + IconPM25_Height + 20;
    CGFloat IconCO_Width = 40;
    CGFloat IconCO_Height = 40;
    [_IconCO setFrame:CGRectMake(IconCO_X, IconCO_Y, IconCO_Width, IconCO_Height)];
    [self addSubview:_IconCO];

    _CO = [[UILabel alloc] init];
    [_CO setText:@"15"];
    CGFloat CO_X = IconPM25_X + IconPM25_Width +5;
    CGFloat CO_Y = IconCO_Y;
    CGFloat CO_Width = 100;
    CGFloat CO_Height = 20;
    [_CO setFrame:CGRectMake(CO_X, CO_Y, CO_Width, CO_Height)];
    [_CO setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_CO];
    
    _COLabel = [[UILabel alloc] init];
    [_COLabel setText:@"CO"];
    CGFloat COLabel_X = PM25_X;
    CGFloat COLabel_Y = IconCO_Y + 20;
    CGFloat COLabel_Width = 100;
    CGFloat COLabel_Height = 20;
    [_COLabel setFrame:CGRectMake(COLabel_X, COLabel_Y, COLabel_Width, COLabel_Height)];
    [_COLabel setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_COLabel];
    
    //SO2
    _IconSO2 = [[UIImageView alloc] init];
    [_IconSO2 setImage:[UIImage imageNamed:@"二氧化硫"]];
    CGFloat IconSO2_X = AirGrade_X + 120;
    CGFloat IconSO2_Y = IconCO_Y;
    CGFloat IconSO2_Width = 40;
    CGFloat IconSO2_Height = 40;
    [_IconSO2 setFrame:CGRectMake(IconSO2_X, IconSO2_Y, IconSO2_Width, IconSO2_Height)];
    [self addSubview:_IconSO2];

    _SO2 = [[UILabel alloc] init];
    [_SO2 setText:@"23"];
    CGFloat SO2_X = IconPM10_X + IconPM10_Width + 5;
    CGFloat SO2_Y = CO_Y;
    CGFloat SO2_Width = 100;
    CGFloat SO2_Height = 20;
    [_SO2 setFrame:CGRectMake(SO2_X, SO2_Y, SO2_Width, SO2_Height)];
    [_SO2 setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_SO2];

    _SO2Label = [[UILabel alloc] init];
    [_SO2Label setText:@"SO2"];
    CGFloat SO2Label_X = PM10_X;
    CGFloat SO2Label_Y = COLabel_Y;
    CGFloat SO2Label_Width = 100;
    CGFloat SO2Label_Height = 20;
    [_SO2Label setFrame:CGRectMake(SO2Label_X, SO2Label_Y, SO2Label_Width, SO2Label_Height)];
    [_SO2Label setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_SO2Label];
    
    //NO2
    _IconNO2 = [[UIImageView alloc] init];
    [_IconNO2 setImage:[UIImage imageNamed:@"二氧化氮"]];
    CGFloat IconNO2_X = AirGrade_X + 240;
    CGFloat IconNO2_Y = IconCO_Y;
    CGFloat IconNO2_Width = 40;
    CGFloat IconNO2_Height = 40;
    [_IconNO2 setFrame:CGRectMake(IconNO2_X, IconNO2_Y, IconNO2_Width, IconNO2_Height)];
    [self addSubview:_IconNO2];

    _NO2 = [[UILabel alloc] init];
    [_NO2 setText:@"54"];
    CGFloat NO2_X = IconO3_X + IconO3_Width + 5;
    CGFloat NO2_Y = IconCO_Y;
    CGFloat NO2_Width = 100;
    CGFloat NO2_Height = 20;
    [_NO2 setFrame:CGRectMake(NO2_X, NO2_Y, NO2_Width, NO2_Height)];
    [_NO2 setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_NO2];

    _NO2Label = [[UILabel alloc] init];
    [_NO2Label setText:@"NO2"];
    CGFloat NO2Label_X = O3_X;
    CGFloat NO2Label_Y = COLabel_Y;
    CGFloat NO2Label_Width = 100;
    CGFloat NO2Label_Height = 20;
    [_NO2Label setFrame:CGRectMake(NO2Label_X, NO2Label_Y, NO2Label_Width, NO2Label_Height)];
    [_NO2Label setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:_NO2Label];
    
    
    
    
    
    
    
    
    
}


@end
