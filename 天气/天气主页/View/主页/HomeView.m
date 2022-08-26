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
//    _scrollviewPage.contentSize = CGSizeMake(SCREEN_WIDTH * 3, SCREEN_HEIGHT);
    [self addSubview:_scrollviewPage];
    _scrollviewPage.pagingEnabled = YES;
    _scrollviewPage.showsVerticalScrollIndicator = NO;
    _scrollviewPage.showsHorizontalScrollIndicator = NO;
    _scrollviewPage.bounces = NO;
    
}










@end
