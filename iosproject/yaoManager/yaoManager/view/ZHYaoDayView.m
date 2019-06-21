//
//  ZHYaoDayView.m
//  yaoManager
//
//  Created by 周奇 on 2018/9/5.
//  Copyright © 2018年 周奇. All rights reserved.
//

#import "ZHYaoDayView.h"
@interface ZHYaoDayView()

@property (nonatomic, readwrite, strong)UILabel *monthLab;
@property (nonatomic, strong)UILabel *dayLab;
@property (nonatomic,strong)UILabel *yaoLab;

@end

@implementation ZHYaoDayView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.monthLab = [[UILabel alloc] init];
        self.monthLab.textAlignment = NSTextAlignmentCenter;
        self.dayLab = [[UILabel alloc] init];
        self.dayLab.textAlignment = NSTextAlignmentCenter;
        self.yaoLab = [[UILabel alloc] init];
        self.yaoLab.textAlignment = NSTextAlignmentCenter;
        
        self.dayLab.frame = CGRectMake(0, 0, frame.size.width, frame.size.height - 25);
        self.yaoLab.frame = CGRectMake(0, self.dayLab.frame.size.height, frame.size.width, 25);
        [self addSubview:self.monthLab];
        [self addSubview:self.dayLab];
        [self addSubview:self.yaoLab];
    }
    return self;
}

-(void)setModel:(ZHBaseModel *)model{
    _model = model;
    NSLog(@"%@ -- %@", model, NSStringFromCGRect(self.frame));
    self.monthLab.textColor = model.monColor;
    self.monthLab.font = [UIFont systemFontOfSize:model.monFontSize];
    self.dayLab.textColor = model.dayColor;
    self.dayLab.font = [UIFont systemFontOfSize:model.dayFontSize];
    self.yaoLab.textColor = model.yaoColor;
    self.yaoLab.font = [UIFont systemFontOfSize:model.yaoFontSize];
    if (model.modelType == ZHModelTypeYueShou) {
        self.yaoLab.text = model.yaoNumber;
        self.monthLab.text = model.mon;
        self.dayLab.text = model.day;
    } else if (model.modelType == ZHModelTypeYueZhong) {
        self.yaoLab.text = model.yaoNumber;
        self.monthLab.text = model.mon;
        self.dayLab.text = model.day;
    } else  {
    
    }
    if (model.isToday) {
        self.backgroundColor = [UIColor redColor];
    }

}



@end
