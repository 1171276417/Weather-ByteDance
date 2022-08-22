//
//  WindView.h
//  Weather
//
//  Created by 邓杰 on 2022/8/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WindView : UIView

///View title
@property(nonatomic, strong)UILabel *title;
///风力icon
@property(nonatomic, strong)UIImageView *WindIcon;
///风向
@property(nonatomic, strong)UILabel *WindDirection;
///风速
@property(nonatomic, strong)UILabel *WindSpeed;
///紫外线
@property(nonatomic, strong)UIImageView *IconUvIndex;
@property(nonatomic, strong)UILabel *UvIndex;
@property(nonatomic, strong)UILabel *UvIndexLabel;
///体感温度
@property(nonatomic, strong)UIImageView *IconFeelsLike;
@property(nonatomic, strong)UILabel *FeelsLike;
@property(nonatomic, strong)UILabel *FeelsLikeLabel;
///能见度
@property(nonatomic, strong)UIImageView *IconVis;
@property(nonatomic, strong)UILabel *Vis;
@property(nonatomic, strong)UILabel *VisLabel;
///大气压
@property(nonatomic, strong)UIImageView *IconPressure;
@property(nonatomic, strong)UILabel *Pressure;
@property(nonatomic, strong)UILabel *PressureLabel;

- (void)LoadWindView;

@end

NS_ASSUME_NONNULL_END
