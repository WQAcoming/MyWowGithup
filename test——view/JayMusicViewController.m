//
//  JayMusicViewController.m
//  test——view
//
//  Created by 吴侨安 on 2017/10/26.
//  Copyright © 2017年 吴侨安. All rights reserved.
//

#import "JayMusicViewController.h"

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
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 50, 50)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 25;
    btn.backgroundColor =[UIColor greenColor];
    [btn addTarget:self action:@selector(leftbtnaction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)leftbtnaction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dealloc
{
    NSLog(@"i,m died");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
