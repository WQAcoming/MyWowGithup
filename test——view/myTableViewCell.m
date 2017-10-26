//
//  myTableViewCell.m
//  test——view
//
//  Created by 吴侨安 on 2017/10/26.
//  Copyright © 2017年 吴侨安. All rights reserved.
//

#import "myTableViewCell.h"
#import "mymodel.h"

@interface myTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *titlelab;
@property (weak, nonatomic) IBOutlet UILabel *titlelabdp;

@end

@implementation myTableViewCell

-(void)setModel:(mymodel *)model
{
    _model = model;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *url = [NSURL URLWithString:model.image_list];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.img setImage:img];
        });
    });
    
    self.titlelab.text = model.theme_name;
    self.titlelabdp.text = model.sub_number;
}

@end
