//
//  ZHYaoTableCell.m
//  yaoManager
//
//  Created by 周奇 on 2018/9/5.
//  Copyright © 2018年 周奇. All rights reserved.
//

#import "ZHYaoTableCell.h"
#import "ZHYaoDayView.h"
@interface ZHYaoTableCell()
@property (nonatomic, strong)NSMutableArray *weekViewArr;
@end

@implementation ZHYaoTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.weekViewArr = [@[] mutableCopy];
//        self.backgroundColor = [UIColor blueColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        CGFloat viewHeight = 70;
        CGFloat space = 10;
        CGFloat viewWidth = ([[UIScreen mainScreen] bounds].size.width - space *2)/7;
        for (NSInteger i = 0; i <7 ; i++) {
            ZHYaoDayView *view = [[ZHYaoDayView alloc] initWithFrame:CGRectMake(space + viewWidth * i, 0, viewWidth, viewHeight)];
            [self.contentView addSubview:view];
            [self.weekViewArr addObject:view];
        }
        
    }
    return self;
}

-(void)setWeekModelArr:(NSArray *)weekModelArr{
    _weekModelArr = weekModelArr;
//    NSLog(@"%@ -- ", weekModelArr);
    for (NSInteger i = 0; i< weekModelArr.count; i++) {
        [self.weekViewArr[i] setModel:weekModelArr[i]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
