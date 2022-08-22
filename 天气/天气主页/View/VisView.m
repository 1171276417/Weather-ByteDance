//
//  VisView.m
//  Weather
//
//  Created by 邓杰 on 2022/8/18.
//

#import "VisView.h"

@implementation VisView

- (void)LoadVisView{
    
    //title
    _title = [[UILabel alloc] init];
    _title.text = @"能见度";
    CGFloat title_X = 20;
    CGFloat title_Y = 10;
    CGFloat title_Width = 100;
    CGFloat title_Height = 20;
    [_title setFrame:CGRectMake(title_X, title_Y, title_Width, title_Height)];
    _title.textAlignment = NSTextAlignmentLeft;
    _title.font = [UIFont systemFontOfSize:18.0];
    [self addSubview:_title];
    
    _Icon = [[UIImageView alloc] init];
    [_Icon setImage:[UIImage imageNamed:@"能见度"]];
    CGFloat Icon_X = 15;
    CGFloat Icon_Y = 50;
    CGFloat Icon_Width = 60;
    CGFloat Icon_Height = 60;
    [_Icon setFrame:CGRectMake(Icon_X, Icon_Y, Icon_Width, Icon_Height)];
    [self addSubview:_Icon];
    
    _Vis = [[UILabel alloc] init];
    [_Vis setText:@"8km"];
    CGFloat FeelsLike_X = 90;
    CGFloat FeelsLike_Y = 50;
    CGFloat FeelsLike_Width = 100;
    CGFloat FeelsLike_Height = 60;
    [_Vis setFrame:CGRectMake(FeelsLike_X, FeelsLike_Y, FeelsLike_Width, FeelsLike_Height)];
    [_Vis setFont:[UIFont boldSystemFontOfSize:30]];
    [_Vis setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:_Vis];

    _VisLabel = [[UILabel alloc] init];
    [_VisLabel setText:@"紫外线强度高 请注意防晒"];
    CGFloat FeelsLikeLabel_X = 20;
    CGFloat FeelsLikeLabel_Y = 150;
    CGFloat FeelsLikeLabel_Width = 150;
    CGFloat FeelsLikeLabel_Height = 20;
    [_VisLabel setFrame:CGRectMake(FeelsLikeLabel_X, FeelsLikeLabel_Y, FeelsLikeLabel_Width, FeelsLikeLabel_Height)];
    [_VisLabel setFont:[UIFont systemFontOfSize:15]];
    [_VisLabel setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:_VisLabel];
    
    
    
    
    
    
    
}





@end
