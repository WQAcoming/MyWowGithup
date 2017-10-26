//
//  ViewController.m
//  test——view
//
//  Created by 吴侨安 on 2017/4/27.
//  Copyright © 2017年 吴侨安. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "mymodel.h"
#import "MJExtension.h"
#import "myTableViewCell.h"
#import "JayMusicViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *myarry;
@property (nonatomic,weak) UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [SVProgressHUD showWithStatus:@"请稍等"];
    [self requestwllan];
}

-(void)addUIbtn
{
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor greenColor];
    btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 50 - 10, 20, 50, 50);
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 25;
    [btn addTarget:self action:@selector(pushmoda) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)pushmoda
{
    JayMusicViewController *jayVc = [[JayMusicViewController alloc] init];
    [self presentViewController:jayVc animated:YES completion:nil];
}

//lazy tab
-(UITableView *)tableview
{
    if (!_tableview) {
        UITableView *tableview = [[UITableView alloc] init];
        tableview.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -20);
        tableview.backgroundColor = [UIColor whiteColor];
        tableview.delegate = self;
        tableview.dataSource = self;
        [self.view addSubview:tableview];
        [self addUIbtn];
        _tableview = tableview;
        }
    return _tableview;
}

-(void)requestwllan
{
    AFHTTPSessionManager *msg = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    
    [msg GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        NSLog(@"=====%@=====",responseObject);
        
        //             字典数组转换模型数组
        self.myarry = [mymodel mj_objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableview reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];

    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myarry.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"tableview";
    
    //缓存中取
    myTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"myTableViewCell" owner:nil options:nil] lastObject];
    }
    
    mymodel *mode = self.myarry[indexPath.row];
    cell.model = mode;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
