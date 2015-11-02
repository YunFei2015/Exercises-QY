//
//  QYTuanGouModel.h
//  作业-微信
//
//  Created by qingyun on 15/10/28.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYTuanGouModel : NSObject

@property (strong, nonatomic) NSString *buycount;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *title;



+(instancetype)tgModelWithDictionary:(NSDictionary *)dict;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
@end
