//
//  DEMOMenuViewController.m
//  RESideMenuExample
//
//  Created by Roman Efimov on 10/10/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOLeftMenuViewController.h"
#import "clockViewController.h"
#import "whaterViewController.h"
#import "WQANavgationController.h"
#import "EmitterViewController.h"
#import "WQADemoTableViewController.h"

@interface DEMOLeftMenuViewController ()

@property (strong, readwrite, nonatomic) UITableView *tableView;
@property (nonatomic,strong) NSArray *titles;

@end

@implementation DEMOLeftMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.origin.y , self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        UIImageView *imgview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Stars"]];
        tableView.backgroundView =imgview;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = NO;
        tableView;
    });
    [self.view addSubview:self.tableView];
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.titles[indexPath.row] isEqualToString:@"Calendar"]) {
        clockViewController *clock = [[clockViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:clock];
        [self presentViewController:nav animated:YES completion:nil];
    } else if ([self.titles[indexPath.row] isEqualToString:@"Profile"])
    {
        whaterViewController *stone = [[whaterViewController alloc] init];
        WQANavgationController *nav1 = [[WQANavgationController alloc] initWithRootViewController:stone];
        [self presentViewController:nav1 animated:YES completion:nil];
    } else if ([self.titles[indexPath.row] isEqualToString:@"Scene animation"])
    {
        EmitterViewController *emittrt = [[EmitterViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:emittrt];
        [self presentViewController:nav animated:YES completion:nil];
    }else if ([self.titles[indexPath.row] isEqualToString:@"demo列表"])
    {
        WQADemoTableViewController *demo = [[WQADemoTableViewController alloc] init];
        WQANavgationController *nav = [[WQANavgationController alloc] initWithRootViewController:demo];
        [self presentViewController:nav animated:YES completion:nil];
    }
    
    //发送通知将视图移到中心
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hideMenuView" object:nil userInfo:nil];
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    self.titles = @[@"",@"",@"",@"Home", @"Calendar", @"Profile", @"demo列表", @"Scene animation"];
    NSArray *images = @[@"",@"",@"",@"IconHome", @"IconCalendar", @"IconProfile", @"IconSettings", @"IconEmpty"];
    cell.textLabel.text = self.titles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    
    return cell;
}


@end
