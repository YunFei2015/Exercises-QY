//
//  QYFriendModel.m
//  作业-微信
//
//  Created by qingyun on 15/10/29.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYFriendModel.h"

@implementation QYFriendModel

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)friendWithDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}
@end
