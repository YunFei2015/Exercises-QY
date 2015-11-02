//
//  QYFriendModel.h
//  作业-微信
//
//  Created by qingyun on 15/10/29.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYFriendModel : NSObject

@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *status;
@property (nonatomic) BOOL vip;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)friendWithDictionary:(NSDictionary *)dict;
@end
