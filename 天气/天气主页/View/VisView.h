//
//  VisView.h
//  Weather
//
//  Created by 邓杰 on 2022/8/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VisView : UIView

///View title
@property(nonatomic, strong)UILabel *title;
///紫外线图标
@property(nonatomic, strong)UIImageView *Icon;
///紫外线强度
@property(nonatomic, strong)UILabel *Vis;
///描述
@property(nonatomic, strong)UILabel *VisLabel;



- (void)LoadVisView;

@end

NS_ASSUME_NONNULL_END
