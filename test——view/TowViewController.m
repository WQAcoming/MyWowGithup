//
//  TowViewController.m
//  test——view
//
//  Created by 吴侨安 on 2017/10/27.
//  Copyright © 2017年 吴侨安. All rights reserved.
//

#import "TowViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "twomodel.h"
#import "MJExtension.h"
#import "twoTableViewCell.h"

static NSString * const ID = @"cell";


@interface TowViewController ()
@property (nonatomic,strong) NSMutableArray *twoarry;
@end

@implementation TowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.tableView registerClass:[twoTableViewCell class] forCellReuseIdentifier:ID];
    [SVProgressHUD showWithStatus:@"请稍等"];
    [self requestwlan];
}



-(void)requestwlan
{
    AFHTTPSessionManager *msg = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"a"] = @"tag_recommend";
    dic[@"action"] = @"sub";
    dic[@"c"] = @"topic";
    
    [msg POST:@"http://api.budejie.com/api/api_open.php" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        self.twoarry = [twomodel mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        
    }];
    
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.twoarry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    twoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    twomodel *mode = self.twoarry[indexPath.row];
    cell.model = mode;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
