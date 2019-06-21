//
//  ZHBaseModel.h
//  yaoManager
//
//  Created by 周奇 on 2018/9/3.
//  Copyright © 2018年 周奇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZHModelType) {
    ZHModelTypeYueShou = 0,  // 月首日
    ZHModelTypeYueZhong,      // 月中
    ZHModelTypeNone  // 空白
};

typedef NS_ENUM(NSUInteger, ZHYaoModel){
    ZHYaoModelDuo = 0,  // 药量多
    ZHYaoModelShao       // 药量少
};


@interface ZHBaseModel : NSObject
/// 数据
@property (nonatomic, copy)NSString *mon;
/// 日
@property (nonatomic, copy)NSString *day;
/// 药量
@property (nonatomic, copy)NSString *yaoNumber;
/// 周几
@property (nonatomic, strong)NSString *week;

@property (nonatomic,assign)ZHModelType modelType;
@property (nonatomic,assign)ZHYaoModel yaoModel;
@property (nonatomic,assign)BOOL isToday;

/// style
@property (nonatomic, strong)UIColor *monColor;
@property (nonatomic, assign)int monFontSize;

@property (nonatomic, strong)UIColor *dayColor;
@property (nonatomic, assign)int dayFontSize;

@property (nonatomic, strong)UIColor *yaoColor;
@property (nonatomic, assign)int yaoFontSize;


+(NSArray *)makeData;




@end
