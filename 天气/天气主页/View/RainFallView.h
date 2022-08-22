//
//  RainFallView.h
//  Weather
//
//  Created by 邓杰 on 2022/8/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RainFallView : UIView
///标题降雨
@property(nonatomic, strong)UILabel *title;
///雨图标
@property(nonatomic, strong)UIImageView *IconRainFall;
///降雨量
@property(nonatomic, strong)UILabel *RainFall;
///相对湿度图标
@property(nonatomic, strong)UIImageView *IconHumidity;
///相对湿度
@property(nonatomic, strong)UILabel *Humidity;
@property(nonatomic, strong)UILabel *HumidityLabel;
///降雨概率图标
@property(nonatomic, strong)UIImageView *IconRainRate;
///降雨概率
@property(nonatomic, strong)UILabel *RainRate;
@property(nonatomic, strong)UILabel *RainRateLable;
///露点温度图标
@property(nonatomic, strong)UIImageView *IconDew;
///露点温度
@property(nonatomic, strong)UILabel *Dew;
@property(nonatomic, strong)UILabel *DewLable;
///云量图标
@property(nonatomic, strong)UIImageView *IconCloudCover;
///云量
@property(nonatomic, strong)UILabel *CloudCover;
@property(nonatomic, strong)UILabel *CloudCoverLabel;

- (void)LoadRainFallView;

@end

NS_ASSUME_NONNULL_END
