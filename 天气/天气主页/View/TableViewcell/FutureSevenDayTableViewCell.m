//
//  FutureSevenDayTableViewCell.m
//  Weather
//
//  Created by 邓杰 on 2022/8/12.
//

#import "FutureSevenDayTableViewCell.h"

@implementation FutureSevenDayTableViewCell

//重写初始化方法 创造控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        //时间
        [self.contentView addSubview:({
            self.Time = [[UILabel alloc] init];
            self.Time;
        })];
        //图标
        [self.contentView addSubview:({
            self.icon = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.icon.contentMode = UIViewContentModeScaleAspectFit;
            self.icon;
        })];
        //描述
        [self.contentView addSubview:({
            self.describe = [[UILabel alloc] init];
            self.describe;
        })];
        //最高最低温度
        [self.contentView addSubview:({
            self.temMaxAndMin = [[UILabel alloc] init];
            self.temMaxAndMin;
        })];
        
    }
    return self;
}


- (void)LoadSevenDayTableViewCell:(GetListItem *)item {
    [self SetData:item];
    [self SetFrame:item];
    
    UIBackgroundConfiguration *configuration = [UIBackgroundConfiguration alloc];
    [configuration setBackgroundColor:[UIColor clearColor]];

    [self setBackgroundConfiguration:configuration];
    
}

///将json返回的日期转换成星期和日期汉字
- (NSString *)FormatWeekDayForDate:(NSString *)fxDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [[formatter dateFromString:fxDate] dateByAddingTimeInterval:(60*60*8)];
    NSArray *weekday = [NSArray arrayWithObjects:[NSNull null], @"周六", @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    NSString *weekStr = [weekday objectAtIndex:theComponents.weekday];
    
    //获取东八区标准时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:[[NSDate date] dateByAddingTimeInterval:(8*60*60)]];
    NSDate *dateNow = [[dateFormatter dateFromString:strDate] dateByAddingTimeInterval:(60*60*8)];
    NSTimeInterval timeBetween = [date timeIntervalSinceDate:dateNow];
    int day = timeBetween/3600/24;
    NSString *str = [[NSString alloc] init];
    
    if(day == 0 && date){
        str = [@"今天" stringByAppendingString:[[[dateFormatter stringFromDate:date] substringWithRange:NSMakeRange(5, 5)] stringByReplacingOccurrencesOfString:@"-" withString:@"/"]];
    }
    if(day == 1){
        str = [@"明天" stringByAppendingString:[[[dateFormatter stringFromDate:date] substringWithRange:NSMakeRange(5, 5)] stringByReplacingOccurrencesOfString:@"-" withString:@"/"]];
    }
    else{
        if(date && day != 0){
            str = [weekStr stringByAppendingString:[[[dateFormatter stringFromDate:date] substringWithRange:NSMakeRange(5, 5)] stringByReplacingOccurrencesOfString:@"-" withString:@"/"]];
        }
    }
    
    return str;
}



///设置数据
- (void)SetData:(GetListItem *)item {
    //日期
    _Time.text = [self FormatWeekDayForDate:item.daily_fxDate];
    //图标
    _icon.image = [UIImage imageNamed:item.daily_iconDay];//白天天气
   // _icon.image = [UIImage imageNamed:item.daily_iconNight];//晚上天气
    //描述
    _describe.text = item.daily_describeDay;//白天描述
    //_describe.text = item.daily_describeNight;//晚上描述
    //最高最低温度
    _temMaxAndMin.text = [[[item.daily_tempMin stringByAppendingString:@"° "] stringByAppendingString:item.daily_tempMax] stringByAppendingString:@"°"];

}

///设置Frame
- (void)SetFrame:(GetListItem *)item {
    //时间
    [_Time setFrame:CGRectMake(0, 15, 100, 20)];
    _Time.textAlignment = NSTextAlignmentLeft;
    _Time.font = [UIFont systemFontOfSize:12.0];
    
    //图标
    [_icon setFrame:CGRectMake(150, 15, 20, 20)];
    //描述
    [_describe setFrame:CGRectMake(180, 15, 80, 20)];
    _describe.textAlignment = NSTextAlignmentLeft;
    _describe.font = [UIFont systemFontOfSize:12.0];
    
    //最高最低温度
    [_temMaxAndMin setFrame:CGRectMake(240, 15, 100, 20)];
    _temMaxAndMin.textAlignment = NSTextAlignmentRight;
    _temMaxAndMin.font = [UIFont systemFontOfSize:12.0];
    
    
    
}







@end
