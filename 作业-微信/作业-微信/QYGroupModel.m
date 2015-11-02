//
//  QYGroupModel.m
//  作业-微信
//
//  Created by qingyun on 15/10/29.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYGroupModel.h"
#import "QYFriendModel.h"

@implementation QYGroupModel

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in _friends) {
            QYFriendModel *friend = [QYFriendModel friendWithDictionary:dict];
            [temp addObject:friend];
        }
        _friends = temp;
    }
    return self;
}

+(instancetype)groupWithDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}
@end
