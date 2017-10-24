//
//  DEMORightMenuViewController.m
//  RESideMenuExample
//
//  Created by Roman Efimov on 2/11/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "DEMORightMenuViewController.h"
#import "DEMOLeftMenuViewController.h"

@interface DEMORightMenuViewController ()

@property (strong, readwrite, nonatomic) UITableView *tableView;

@end

@implementation DEMORightMenuViewController

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
    return 2;
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
    
    NSArray *titles = @[@"Test 1", @"Test 2"];
    cell.textLabel.text = titles[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    
    return cell;
}

@end
