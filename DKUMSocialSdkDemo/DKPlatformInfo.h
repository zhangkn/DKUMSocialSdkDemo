//
//  DKPlatformInfo.h
//  DKUMSocialSdkDemo
//
//  Created by devzkn on 08/10/2016.
//  Copyright © 2016 DevKevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import <UMSocialCore/UMSocialCore.h>
/**存储着包含：平台类型、平台名称、平台icon 数据模型*/
@interface DKPlatformInfo : NSObject
@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,copy) NSString *paltFormName;
@property (nonatomic,assign) UMSocialPlatformType platformType;


/**
 提供类方法，返回数据模型数组--工厂模式  ,或者采用框架MJExtension
 */
+ (NSMutableArray *) platformInfolist;
//定义初始化方法 KVC的使用
//- (instancetype) initWithDictionary:(NSDictionary *) dict;
//+ (instancetype) platformInfoWithDictionary:(NSDictionary *) dict;

@end
