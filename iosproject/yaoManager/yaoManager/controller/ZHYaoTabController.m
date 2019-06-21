//
//  ZHYaoTabController.m
//  yaoManager
//
//  Created by 周奇 on 2018/9/5.
//  Copyright © 2018年 周奇. All rights reserved.
//

#import "ZHYaoTabController.h"
#import "ZHBaseModel.h"
#import "ZHYaoTableCell.h"
@interface ZHYaoTabController ()
@property (nonatomic, strong) NSArray *modelArr;
@end

@implementation ZHYaoTabController

-(NSArray *)modelArr {
    if (!_modelArr) {
        NSArray *temp = [ZHBaseModel makeData];
        NSMutableArray *tempM = [@[] mutableCopy];
        for (NSInteger i = 1; i < [(ZHBaseModel *)temp[0] week].intValue; i++) {
            ZHBaseModel *model = [ZHBaseModel new];
            model.modelType =  ZHModelTypeNone;
            [tempM addObject:model];
        }
        [tempM addObjectsFromArray:temp];
        NSInteger yu = tempM.count % 7;
        if (yu != 0) {
            for (NSInteger i = 0; i < 7 - yu; i++) {
                ZHBaseModel *model = [ZHBaseModel new];
                model.modelType =  ZHModelTypeNone;
                [tempM addObject:model];
            }
        }
        for (ZHBaseModel *model in tempM) {
            if (model.modelType != ZHModelTypeNone){
                model.yaoNumber = @"1";
            }
        }
        
        _modelArr = [tempM copy];
    }
    return _modelArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArr.count / 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const indentifi = @"yaoId";
    ZHYaoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifi];
    if (!cell) {
        cell = [[ZHYaoTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifi];
    }
    NSMutableArray *tempA = [@[] mutableCopy];
    for (NSInteger i = indexPath.row * 7; i <(indexPath.row+1) * 7; i++) {
        [tempA addObject:self.modelArr[i]];
    }
    cell.weekModelArr = [tempA mutableCopy];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
