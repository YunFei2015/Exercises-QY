//
//  QYTuanGouModel.m
//  作业-微信
//
//  Created by qingyun on 15/10/28.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYTuanGouModel.h"

@implementation QYTuanGouModel

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)tgModelWithDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}

@end
