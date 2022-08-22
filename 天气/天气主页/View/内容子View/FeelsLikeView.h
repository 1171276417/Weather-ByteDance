//
//  FeelsLikeView.h
//  Weather
//
//  Created by 邓杰 on 2022/8/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeelsLikeView : UIView

///View title
@property(nonatomic, strong)UILabel *title;
///体感温度图标
@property(nonatomic, strong)UIImageView *Icon;
///体感温度
@property(nonatomic, strong)UILabel *FeelsLike;
///描述
@property(nonatomic, strong)UILabel *FeelsLikeLabel;




- (void)LoadFeelsLikeView;

@end

NS_ASSUME_NONNULL_END
