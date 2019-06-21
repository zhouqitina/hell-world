//
//  ZHBaseModel.m
//  yaoManager
//
//  Created by 周奇 on 2018/9/3.
//  Copyright © 2018年 周奇. All rights reserved.
//

#import "ZHBaseModel.h"

@implementation ZHBaseModel
- (UIColor *)monColor
{
    if (!_monColor) {
        _monColor = [UIColor redColor];
    }
    return _monColor;
}

- (int)monFontSize
{
    return 33;
}

- (UIColor *)dayColor
{
    if (!_dayColor) {
        _dayColor = [UIColor blueColor];
    }
    return _dayColor;
}

- (int)dayFontSize
{
    return 35;
}

- (UIColor *)yaoColor{
    if (!_yaoColor) {
        _yaoColor = [UIColor greenColor];
    }
    return _yaoColor;
}

- (int)yaoFontSize
{
    return 28;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"%@-%@ %@", self.mon, self.day, self.week];
    
}

+(NSArray *)makeData{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger DaysInMonth = range.length;
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:[NSDate date]];
    NSLog(@"NSDateComponents是这个样子的:%@",comps);
    NSString *dateT = nil;
    NSInteger preYear = 0;
    NSInteger preMonth = 0;
    NSInteger preDays = 30;
    NSInteger nextYear = 0;
    NSInteger nextMonth = 0;
    NSInteger nextDays = 30;
    if (comps.month == 12) {
        preYear = comps.year;
        preMonth = 11;
        preDays = 30;
        nextYear = comps.year + 1;
        nextYear = 1;
        nextDays = 31;
    } else if(comps.month == 1) {
        preYear = comps.year -1;
        preMonth = 12;
        preDays = 31;
        nextYear = comps.year;
        nextMonth = 2;
        dateT = [NSString stringWithFormat:@"%lu-%lu-1 00:00:00",nextYear,nextMonth];
        range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[self theTargetStringConversionDate:dateT]];
        nextDays = range.length;
    } else {
        preYear = comps.year;
        preMonth = comps.month -1;
        dateT = [NSString stringWithFormat:@"%lu-%lu-1 00:00:00",preYear,preMonth];
        range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[self theTargetStringConversionDate:dateT]];
        preDays = range.length;
        
        nextYear = comps.year;
        nextMonth = comps.month + 1;
        dateT = [NSString stringWithFormat:@"%lu-%lu-1 00:00:00",nextYear,nextMonth];
        range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[self theTargetStringConversionDate:dateT]];
        nextDays = range.length;
        
    }
    NSLog(@"%ld - %ld _ %ld",preYear,preMonth,preDays);
    
    NSMutableArray * temp = [@[] mutableCopy];
    if (comps.day >= 10) {
        for (NSInteger i = comps.day - 10; i <= DaysInMonth  ; i++) {
           NSString *str =  [NSString stringWithFormat:@"%lu-%lu-%ld 00:00:00",comps.year, comps.month,i];
            NSDateComponents *com = [self componentWishDateStr:str];
            ZHBaseModel *model = [[ZHBaseModel alloc] init];
            model.mon = [NSString stringWithFormat:@"%lu",com.month];
            model.day = [NSString stringWithFormat:@"%ld",com.day];
            model.week = [NSString stringWithFormat:@"%ld",com.weekday];
            if (i == comps.day){
                model.isToday = YES;
            }
            
            if (i == 1) {
                model.modelType = ZHModelTypeYueShou;
            } else {
                model.modelType = ZHModelTypeYueZhong;
            }
            [temp addObject:model];
        }
        for (NSInteger i = 1; i <= nextDays; i++) {
            NSString *str =  [NSString stringWithFormat:@"%lu-%lu-%ld 00:00:00",nextYear, nextMonth,i];
            NSDateComponents *com = [self componentWishDateStr:str];
            ZHBaseModel *model = [[ZHBaseModel alloc] init];
            model.mon = [NSString stringWithFormat:@"%lu",com.month];
            model.day = [NSString stringWithFormat:@"%ld",com.day];
            model.week = [NSString stringWithFormat:@"%ld",com.weekday];
            [temp addObject:model];
            if (i == 1) {
                model.modelType = ZHModelTypeYueShou;
            } else {
                model.modelType = ZHModelTypeYueZhong;
            }

        }
        
    } else {
        NSInteger cha = 10 - comps.day - 1;
        for (NSInteger i = preDays - cha ; i <= preDays; i++) {
            NSString *str =  [NSString stringWithFormat:@"%lu-%lu-%ld 00:00:00",preYear, preMonth,i];
            NSDateComponents *com = [self componentWishDateStr:str];
            ZHBaseModel *model = [[ZHBaseModel alloc] init];
            model.mon = [NSString stringWithFormat:@"%lu",com.month];
            model.day = [NSString stringWithFormat:@"%ld",com.day];
            model.week = [NSString stringWithFormat:@"%ld",com.weekday];
            if (i == 1) {
                model.modelType = ZHModelTypeYueShou;
            } else {
                model.modelType = ZHModelTypeYueZhong;
            }
            [temp addObject:model];
        }
        for (NSInteger i = 1; i <= DaysInMonth ; i++) {
            NSString *str =  [NSString stringWithFormat:@"%lu-%lu-%ld 00:00:00",comps.year, comps.month,i];
            NSDateComponents *com = [self componentWishDateStr:str];
            ZHBaseModel *model = [[ZHBaseModel alloc] init];
            model.mon = [NSString stringWithFormat:@"%lu",com.month];
            model.day = [NSString stringWithFormat:@"%ld",com.day];
            model.week = [NSString stringWithFormat:@"%ld",com.weekday];
            if (i == comps.day){
                model.isToday = YES;
            }
            if (i == 1) {
                model.modelType = ZHModelTypeYueShou;
            } else {
                model.modelType = ZHModelTypeYueZhong;
            }
            [temp addObject:model];
        }
        for (NSInteger i = 1; i <= 10; i++) {
            NSString *str =  [NSString stringWithFormat:@"%lu-%lu-%ld 00:00:00",nextYear, nextMonth,i];
            NSDateComponents *com = [self componentWishDateStr:str];
            ZHBaseModel *model = [[ZHBaseModel alloc] init];
            model.mon = [NSString stringWithFormat:@"%lu",com.month];
            model.day = [NSString stringWithFormat:@"%ld",com.day];
            model.week = [NSString stringWithFormat:@"%ld",com.weekday];
            if (i == 1) {
                model.modelType = ZHModelTypeYueShou;
            } else {
                model.modelType = ZHModelTypeYueZhong;
            }
            [temp addObject:model];
        }
    }
    NSLog(@"%@",temp);
    
    return [temp copy];

}

+(NSDateComponents *) componentWishDateStr:(NSString *)str{
    NSDate *tempD = [self theTargetStringConversionDate:str];
    NSCalendar *calendar  = [NSCalendar currentCalendar];
    return [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:tempD];
}


// NSString对象转date
+(NSDate* )theTargetStringConversionDate:(NSString *)str
{
    //设置转换格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[formatter dateFromString:str];
    return date;
}

@end
