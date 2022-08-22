//
//  FutureOneDayTableViewCell.m
//  Weather
//
//  Created by 邓杰 on 2022/8/12.
//

#import "FutureOneDayTableViewCell.h"

@implementation FutureOneDayTableViewCell

//重写初始化方法 创造控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        //时间
        [self.contentView addSubview:({
            self.time = [[UILabel alloc] init];
            self.time;
        })];
        //图标
        [self.contentView addSubview:({
            self.icon = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.icon.contentMode = UIViewContentModeScaleAspectFit;
            self.icon;
        })];
        //温度
        [self.contentView addSubview:({
            self.temperature = [[UILabel alloc] init];
            self.temperature;
        })];
        
    }
    return self;
}


- (void)LoadFutureOneDayTableViewCell:(GetListItem *)item{
    [self SetFrame:item];
    [self SetData:item];

    UIBackgroundConfiguration *configuration = [UIBackgroundConfiguration alloc];
    [configuration setBackgroundColor:[UIColor clearColor]];



    [self setBackgroundConfiguration:configuration];
}

///设置Frame
- (void)SetFrame:(GetListItem *)item{
    //时间位置
    [_time setFrame:CGRectMake(10, 10, 30, 30)];
    _time.textAlignment = NSTextAlignmentCenter;
    _time.font = [UIFont systemFontOfSize:12.0];
    
    //图标位置
    [_icon setFrame:CGRectMake(10, 45, 30, 30)];
    
    //温度位置
    [_temperature setFrame:CGRectMake(10, 80, 30, 20)];
    _temperature.textAlignment = NSTextAlignmentCenter;

}

///设置Data
- (void)SetData:(GetListItem *)item{
    
    //时间数据解析
    NSString *strTime = [[item.hourly_fxTime substringWithRange:NSMakeRange(11,2)] stringByAppendingString:@"时"];
    _time.text = strTime;
    //图标
    [_icon setImage:[UIImage imageNamed:item.hourly_icon]];
    //温度
    _temperature.text = [item.hourly_temperature stringByAppendingString:@"°"];
  
}





@end
