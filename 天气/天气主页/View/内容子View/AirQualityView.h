//
//  AirQualityView.h
//  Weather
//
//  Created by 邓杰 on 2022/8/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AirQualityView : UIView
///View title
@property(nonatomic, strong) UILabel *title;
///空气质量系数和等级
@property(nonatomic, strong) UILabel *AirGrade;
///空气质量描述
@property(nonatomic, strong) UILabel *describe;
///PM2.5
@property(nonatomic, strong) UIImageView *IconPM25;
@property(nonatomic, strong) UILabel *PM25;
@property(nonatomic, strong) UILabel *PM25Label;
///PM10
@property(nonatomic, strong) UIImageView *IconPM10;
@property(nonatomic, strong) UILabel *PM10;
@property(nonatomic, strong) UILabel *PM10Label;
///O3
@property(nonatomic, strong) UIImageView *IconO3;
@property(nonatomic, strong) UILabel *O3;
@property(nonatomic, strong) UILabel *O3Label;
///CO
@property(nonatomic, strong) UIImageView *IconCO;
@property(nonatomic, strong) UILabel *CO;
@property(nonatomic, strong) UILabel *COLabel;
///SO2
@property(nonatomic, strong) UIImageView *IconSO2;
@property(nonatomic, strong) UILabel *SO2;
@property(nonatomic, strong) UILabel *SO2Label;
///NO2
@property(nonatomic, strong) UIImageView *IconNO2;
@property(nonatomic, strong) UILabel *NO2;
@property(nonatomic, strong) UILabel *NO2Label;



- (void)LoadAirQualityView;

@end

NS_ASSUME_NONNULL_END
