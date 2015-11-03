//
//  QYTGSearchResultTableViewController.h
//  作业-微信
//
//  Created by qingyun on 15/11/2.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYTGSearchResultTableViewController : UITableViewController <UISearchResultsUpdating>

//@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) NSMutableArray *datas;
@end
