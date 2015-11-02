//
//  QYContactsSectionHeaderView.h
//  作业-微信
//
//  Created by qingyun on 15/10/29.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYGroupModel.h"

@interface QYContactsSectionHeaderView : UITableViewHeaderFooterView

@property (strong, nonatomic) UIButton *headerBtn;
@property (strong, nonatomic) UILabel *onlineNumLabel;

@property (strong, nonatomic) QYGroupModel *group;
@property (strong, nonatomic) void(^reloadData)(void);
@end
