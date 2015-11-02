//
//  QYContactsSectionHeaderView.m
//  作业-微信
//
//  Created by qingyun on 15/10/29.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYContactsSectionHeaderView.h"
#import "common.h"

@implementation QYContactsSectionHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:headerBtn];
        
        [headerBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        UIImage *bgImage = [UIImage imageNamed:@"buddy_header_bg"];
        [headerBtn setBackgroundImage:[bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(44, 1, 44, 0) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
        
        UIImage *bgHighlightedImage = [UIImage imageNamed:@"buddy_header_bg_highlighted"];
        [headerBtn setBackgroundImage:[bgHighlightedImage resizableImageWithCapInsets:UIEdgeInsetsMake(44, 1, 44, 0) resizingMode:UIImageResizingModeStretch] forState:UIControlStateHighlighted];
        
        [headerBtn addTarget:self action:@selector(headerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _headerBtn = headerBtn;
       
        
        UILabel *onlineNumLabel = [[UILabel alloc]init];
        [headerBtn addSubview:onlineNumLabel];
        _onlineNumLabel = onlineNumLabel;
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.headerBtn.frame = self.bounds;
    self.headerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.headerBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    self.headerBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self.headerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.headerBtn.imageView.contentMode = UIViewContentModeCenter;
    self.headerBtn.imageView.clipsToBounds = NO;

    self.onlineNumLabel.frame = CGRectMake(QYScreenW - 40, 10, 40, 20);
    self.onlineNumLabel.font = [UIFont systemFontOfSize:13];
}

-(void)headerBtnClick:(UIButton *)sender{
    _group.isOpen = !_group.isOpen;
  
    if (_reloadData) {
        _reloadData();
    }
    
}
@end
