//
//  ScreenFrame.h
//  Weather
//
//  Created by 邓杰 on 2022/7/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//屏幕宽高
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

// 底部高度
#define SAFEDISTANCEBOTTOM safeDistanceBottom()
#define TABBARHEIGHT (49)
#define SAFEDISTANCE_TABBAR_HEIGHT (SAFEDISTANCEBOTTOM + TABBARHEIGHT)
//下面的整体高度
#define UI(x) UIAdapter(x)
#define UIRect(x, y, width, height) UIRectAdapter(x, y, width, height)
// 顶部高度
#define STATUSBARHEIGHT statusBarHeight()
// 还要注意statusBar下面的navigationBar的高度:44
#define NAVIGATIONBARHEIGHT (44)
#define STATUS_NAVIGATION_BAR_HEIGHT (STATUSBARHEIGHT + NAVIGATIONBARHEIGHT)
// 上面的整体高度








@interface ScreenFrame : NSObject

@end

NS_ASSUME_NONNULL_END
