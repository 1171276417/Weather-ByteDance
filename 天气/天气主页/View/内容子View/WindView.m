//
//  WindView.m
//  Weather
//
//  Created by 邓杰 on 2022/8/16.
//

#import "WindView.h"

@implementation WindView

- (void)LoadWindView{
    
    
    //title
    _title = [[UILabel alloc] init];
    _title.text = @"风";
    CGFloat title_X = 20;
    CGFloat title_Y = 10;
    CGFloat title_Width = 100;
    CGFloat title_Height = 20;
    [_title setFrame:CGRectMake(title_X, title_Y, title_Width, title_Height)];
    _title.textAlignment = NSTextAlignmentLeft;
    _title.font = [UIFont systemFontOfSize:18.0];
    [self addSubview:_title];
    
    //风
    _WindIcon = [[UIImageView alloc] init];
    [_WindIcon setImage:[UIImage imageNamed:@"风向"]];
    CGFloat WindIcon_X = 15;
    CGFloat WindIcon_Y = 50;
    CGFloat WindIcon_Width = 70;
    CGFloat WindIcon_Height = 100;
    [_WindIcon setFrame:CGRectMake(WindIcon_X, WindIcon_Y, WindIcon_Width, WindIcon_Height)];
    [self addSubview:_WindIcon];

    _WindDirection = [[UILabel alloc] init];
    [_WindDirection setText:@"南风3级"];
    CGFloat WindDirection_X = WindIcon_X + WindIcon_Y + 20;
    CGFloat WindDirection_Y = WindIcon_Y + 50;
    CGFloat WindDirection_Width = 100;
    CGFloat WindDirection_Height = 25;
    [_WindDirection setFrame:CGRectMake(WindDirection_X, WindDirection_Y, WindDirection_Width, WindDirection_Height)];
    [_WindDirection setFont:[UIFont systemFontOfSize:20.0]];
    [_WindDirection setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:_WindDirection];
    
    _WindSpeed = [[UILabel alloc] init];
    [_WindSpeed setText:@"15km/h"];
    CGFloat WindSpeed_X = WindDirection_X;
    CGFloat WindSpeed_Y = WindDirection_Y + WindDirection_Height + 10;
    CGFloat WindSpeed_Width = 100;
    CGFloat WindSpeed_Height = 25;
    [_WindSpeed setFrame:CGRectMake(WindSpeed_X, WindSpeed_Y, WindSpeed_Width, WindSpeed_Height)];
    [_WindSpeed setFont:[UIFont systemFontOfSize:20.0]];
    [_WindSpeed setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:_WindSpeed];

//    //体感温度
//    _IconFeelsLike = [[UIImageView alloc] init];
//    [_IconFeelsLike setImage:[UIImage imageNamed:@"体感温度"]];
//    CGFloat IconFeelsLike_X = 120;
//    CGFloat IconFeelsLike_Y = 40;
//    CGFloat IconFeelsLike_Width = 40;
//    CGFloat IconFeelsLike_Height = 40;
//    [_IconFeelsLike setFrame:CGRectMake(IconFeelsLike_X, IconFeelsLike_Y, IconFeelsLike_Width, IconFeelsLike_Height)];
//    [self addSubview:_IconFeelsLike];
//
//    _FeelsLike = [[UILabel alloc] init];
//    [_FeelsLike setText:@"46°"];
//    CGFloat FellsLike_X = IconFeelsLike_X + IconFeelsLike_Width + 10;
//    CGFloat FellsLike_Y = IconFeelsLike_Y;
//    CGFloat FellsLike_Width = 100;
//    CGFloat FellsLike_Height = 20;
//    [_FeelsLike setFrame:CGRectMake(FellsLike_X, FellsLike_Y, FellsLike_Width, FellsLike_Height)];
//    [_FeelsLike setFont:[UIFont systemFontOfSize:15]];
//    [self addSubview:_FeelsLike];
//
//    _FeelsLikeLabel = [[UILabel alloc] init];
//    [_FeelsLikeLabel setText:@"体感温度"];
//    CGFloat FeelLikeLabel_X = FellsLike_X;
//    CGFloat FeelLikeLabel_Y = FellsLike_Y + FellsLike_Height ;
//    CGFloat FeelLikeLabel_Width = 100;
//    CGFloat FeelLikeLabel_Height = 20;
//    [_FeelsLikeLabel setFrame:CGRectMake(FeelLikeLabel_X, FeelLikeLabel_Y, FeelLikeLabel_Width, FeelLikeLabel_Height)];
//    [_FeelsLikeLabel setFont:[UIFont systemFontOfSize:15.0]];
//    [self addSubview:_FeelsLikeLabel];
//
//    //紫外线
//    _IconUvIndex = [[UIImageView alloc] init];
//    [_IconUvIndex setImage:[UIImage imageNamed:@"强紫外线"]];
//    CGFloat IconUvIndex_X = IconFeelsLike_X;
//    CGFloat IconUvIndex_Y = IconFeelsLike_Y + IconFeelsLike_Height + 40;
//    CGFloat IconUvIndex_Width = 40;
//    CGFloat IconUvIndex_Height = 40;
//    [_IconUvIndex setFrame:CGRectMake(IconUvIndex_X, IconUvIndex_Y, IconUvIndex_Width, IconUvIndex_Height)];
//    [self addSubview:_IconUvIndex];
//
//    _UvIndex = [[UILabel alloc] init];
//    [_UvIndex setText:@"7"];
//    CGFloat UvIndex_X = FellsLike_X;
//    CGFloat UvIndex_Y = IconUvIndex_Y;
//    CGFloat UvIndex_Width = 100;
//    CGFloat UvIndex_Height = 20;
//    [_UvIndex setFrame:CGRectMake(UvIndex_X, UvIndex_Y, UvIndex_Width, UvIndex_Height)];
//    [_UvIndex setFont:[UIFont systemFontOfSize:15.0]];
//    [self addSubview:_UvIndex];
//
//    _UvIndexLabel = [[UILabel alloc] init];
//    [_UvIndexLabel setText:@"紫外线"];
//    CGFloat UvIndexLabel_X = UvIndex_X;
//    CGFloat UvIndexLabel_Y = UvIndex_Y + UvIndex_Height;
//    CGFloat UvIndexLabel_Width = 199;
//    CGFloat UvIndexLabel_Height = 20;
//    [_UvIndexLabel setFrame:CGRectMake(UvIndexLabel_X, UvIndexLabel_Y, UvIndexLabel_Width, UvIndexLabel_Height)];
//    [_UvIndexLabel setFont:[UIFont systemFontOfSize:15.0]];
//    [self addSubview:_UvIndexLabel];

    
}

@end
