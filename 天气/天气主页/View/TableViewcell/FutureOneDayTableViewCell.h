//
//  FutureOneDayTableViewCell.h
//  Weather
//
//  Created by 邓杰 on 2022/8/12.
//

#import <UIKit/UIKit.h>
#import "GetListItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface FutureOneDayTableViewCell : UITableViewCell
@property(nonatomic, strong) GetListItem *item;

@property(nonatomic, strong) UILabel *time;
@property(nonatomic, strong) UIImageView *icon;
@property(nonatomic, strong) UILabel *temperature;

///自定义加载cell
- (void)LoadFutureOneDayTableViewCell:(GetListItem *)item;

@end

NS_ASSUME_NONNULL_END
