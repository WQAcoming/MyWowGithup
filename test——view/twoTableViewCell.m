//
//  twoTableViewCell.m
//  test——view
//
//  Created by 吴侨安 on 2017/10/27.
//  Copyright © 2017年 吴侨安. All rights reserved.
//

#import "twoTableViewCell.h"
#import "twomodel.h"

@interface twoTableViewCell()
@property (nonatomic,weak) UIImageView *img;
@property (nonatomic,weak) UILabel* lab;
@property (nonatomic,weak) UILabel* labdx;

@end

@implementation twoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 55, 55)];
        [self.contentView addSubview:img];
        self.img = img;
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(85, 20, 100, 30)];
        [self.contentView addSubview:lab];
        self.lab = lab;
        
        UILabel *labdx = [[UILabel alloc] initWithFrame:CGRectMake(85, 40, 100, 30)];
        [self.contentView addSubview:labdx];
        self.labdx = labdx;
    }
    return self;
}

-(void)setModel:(twomodel *)model
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
    
    self.lab.text = model.theme_name;
    self.labdx.text = model.sub_number;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
