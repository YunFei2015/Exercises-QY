//
//  QYTuanGouTableViewCell.m
//  作业-微信
//
//  Created by qingyun on 15/10/28.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYTuanGouTableViewCell.h"

@implementation QYTuanGouTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *buycountLabel = [[UILabel alloc] initWithFrame:CGRectMake(QYScreenW - 100, 60, 100, 30)];
        [self.contentView addSubview:buycountLabel];
        _buycountLabel = buycountLabel;
        
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
