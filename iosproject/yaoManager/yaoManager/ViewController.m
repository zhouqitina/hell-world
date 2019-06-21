//
//  ViewController.m
//  yaoManager
//
//  Created by 周奇 on 2018/9/3.
//  Copyright © 2018年 周奇. All rights reserved.
//

#import "ViewController.h"
#import "ZHBaseModel.h"
#import "ZHYaoTabController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *yueFenLab;
@property (weak, nonatomic) IBOutlet UILabel *dayLab;
@property (weak, nonatomic) IBOutlet UILabel *yaoNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)clickBtn:(id)sender {
    ZHYaoTabController *controller = [[ZHYaoTabController alloc] init];
    [self presentViewController:controller animated:YES completion:Nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
