//
//  HomeView.m
//  Weather
//
//  Created by 邓杰 on 2022/7/25.
//

#import "HomeView.h"

@implementation HomeView

- (void)LoadHomeView{
    
    _scrollviewPage = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    //_scrollviewPage.contentSize = CGSizeMake(SCREEN_WIDTH * 3, SCREEN_HEIGHT);
    [self addSubview:_scrollviewPage];
    _scrollviewPage.pagingEnabled = YES;
    _scrollviewPage.showsVerticalScrollIndicator = NO;
    _scrollviewPage.showsHorizontalScrollIndicator = NO;
    //_scrollviewPage.bounces = NO;
    
    
    
//    _weatherview = [[WeatherView alloc] init];
//    [_weatherview setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    [_weatherview LoadWeatherView];
//    [_scrollviewPage addSubview:_weatherview];
    

//    _btnLocation = [UIButton buttonWithType:UIButtonTypeCustom];
//    _btnLocation.frame = CGRectMake(20, 40, 30, 30);
//    [_btnLocation setImage:[UIImage imageNamed:@"Location"] forState:UIControlStateNormal];
//    [self addSubview:_btnLocation];
//    
//    _btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
//    _btnAdd.frame = CGRectMake(390-50, 40, 30, 30);
//    [_btnAdd setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
//    [self addSubview:_btnAdd];
    
    
    
    
}










@end
