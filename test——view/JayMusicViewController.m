//
//  JayMusicViewController.m
//  test——view
//
//  Created by 吴侨安 on 2017/10/26.
//  Copyright © 2017年 吴侨安. All rights reserved.
//

#import "JayMusicViewController.h"
#import "TowViewController.h"

@interface JayMusicViewController ()
{
    UIImageView *imgview;
}

@end

@implementation JayMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Stars"]];
    img.frame = self.view.bounds;
    [self.view addSubview:img];
    imgview = img;
    
    [self addUIToolbar];
    
    [self addleftbtn];
    
    [self addrightbtn];
    
}

-(void)addUIToolbar
{
    UIToolbar *toobar = [[UIToolbar alloc] initWithFrame:self.view.bounds];
    toobar.alpha = 0.98;
    toobar.barStyle = UIBarStyleBlack;
    
    [imgview addSubview:toobar];
}

-(void)addleftbtn
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"🔙" style:UIBarButtonItemStylePlain target:self action:@selector(leftbtnaction)];
}

-(void)addrightbtn
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"🐓" style:UIBarButtonItemStylePlain target:self action:@selector(pushAction)];
}

-(void)leftbtnaction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)pushAction
{
    TowViewController *twovc = [[TowViewController alloc] init];
    twovc.title = @"不带xib的tab";
    [self.navigationController pushViewController:twovc animated:YES];
}

-(void)dealloc
{
    NSLog(@"i,m died");
}

@end
