//
//  FutureSevenDayTableViewCell.h
//  Weather
//
//  Created by 邓杰 on 2022/8/12.
//

#import <UIKit/UIKit.h>
#import "GetListItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface FutureSevenDayTableViewCell : UITableViewCell

///时间
@property(nonatomic, strong)UILabel *Time;
///天气图标
@property(nonatomic, strong)UIImageView *icon;
///天气描述
@property(nonatomic, strong)UILabel *describe;
///最高最低温度
@property(nonatomic, strong)UILabel *temMaxAndMin;


- (void)LoadSevenDayTableViewCell:(GetListItem *)item;


@end

NS_ASSUME_NONNULL_END
