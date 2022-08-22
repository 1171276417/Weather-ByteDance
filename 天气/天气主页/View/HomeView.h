//
//  HomeView.h
//  Weather
//
//  Created by 邓杰 on 2022/7/25.
//

#import <UIKit/UIKit.h>
#import "ScreenFrame.h"
#import "WeatherView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeView : UIView
@property(nonatomic, strong) WeatherView *weatherview;
@property(nonatomic, strong) UIScrollView *scrollviewPage;//Basic

@property(nonatomic, strong) UIButton *btnLocation;
@property(nonatomic, strong) UIButton *btnAdd;






- (void)LoadHomeView;

@end

NS_ASSUME_NONNULL_END
