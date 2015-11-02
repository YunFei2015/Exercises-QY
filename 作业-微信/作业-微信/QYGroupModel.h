//
//  QYGroupModel.h
//  作业-微信
//
//  Created by qingyun on 15/10/29.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYGroupModel : NSObject

@property (strong, nonatomic) NSMutableArray *friends;
@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSInteger online;

@property (nonatomic) BOOL isOpen;

-(instancetype) initWithDictionary:(NSDictionary *)dict;
+(instancetype) groupWithDictionary:(NSDictionary *)dict;
@end
