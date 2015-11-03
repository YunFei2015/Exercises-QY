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
        UILabel *buycountLabel = [[UILabel alloc] initWithFrame:CGRectMake(QYScreenW - 100, 80, 100, 20)];
        [self.contentView addSubview:buycountLabel];
        buycountLabel.font = [UIFont systemFontOfSize:13];
        buycountLabel.textAlignment = NSTextAlignmentRight;
        _buycountLabel = buycountLabel;
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 80, 100, 20)];
        [self.contentView addSubview:detailLabel];
        detailLabel.font = [UIFont systemFontOfSize:13];
        _detailLabel = detailLabel;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 10, 200, 30)];
        [self.contentView addSubview:titleLabel];

        _titleLabel = titleLabel;
        
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
