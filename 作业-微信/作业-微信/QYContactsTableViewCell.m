//
//  QYContactsTableViewCell.m
//  作业-微信
//
//  Created by qingyun on 15/10/29.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYContactsTableViewCell.h"

@implementation QYContactsTableViewCell

-(void)setFriend:(QYFriendModel *)friend{
    _friend = friend;
    
    self.imageView.image = [UIImage imageNamed:friend.icon];
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.status;
    self.isVip = friend.vip;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
