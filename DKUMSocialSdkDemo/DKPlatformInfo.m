//
//  DKPlatformInfo.m
//  DKUMSocialSdkDemo
//
//  Created by devzkn on 08/10/2016.
//  Copyright © 2016 DevKevin. All rights reserved.
//

#import "DKPlatformInfo.h"

#define UMSAuthPlatformTypeKey @"platformType"
#define UMSAuthPlatformNameKey @"paltFormName"
#define UMSAuthPlatformIconNameKey @"imageName"

@implementation DKPlatformInfo

+ (NSMutableArray *)platformInfolist{
    
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:10];
    //定义平台类型数组 初始化
    NSArray *paltformTypeArray = [NSArray arrayWithObjects:@(UMSocialPlatformType_Sina),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_TencentWb),@(UMSocialPlatformType_Renren),@(UMSocialPlatformType_Douban),@(UMSocialPlatformType_Facebook),@(UMSocialPlatformType_Twitter),@(UMSocialPlatformType_Linkedin), nil];
    
    for (NSNumber *platformType in paltformTypeArray) {
        NSMutableDictionary *dict = [self dictWithPlatformName:platformType];
        [dict setValue:platformType forKey:UMSAuthPlatformTypeKey];
        if (dict) {
            [tmp addObject:dict];
        }
    }
    return [self mj_objectArrayWithKeyValuesArray:tmp];
}



/** 辅助方法，根据品台类型，返回 存储着对应icon、中文名称的字典*/
+ (NSMutableDictionary *)dictWithPlatformName:(NSNumber *)platformType
{
    UMSocialPlatformType platformType_int = [platformType integerValue];
    NSString *imageName = nil;
    NSString *paltFormName = nil;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:1];
    switch (platformType_int) {
        case UMSocialPlatformType_Sina:
            imageName = @"UMS_sina_icon";
            paltFormName = @"新浪";
            break;
        case UMSocialPlatformType_WechatSession:
            imageName = @"UMS_wechat_icon";
            paltFormName = @"微信";
            break;
        case UMSocialPlatformType_QQ:
            imageName = @"UMS_qq_icon";
            paltFormName = @"QQ";
            break;
        case UMSocialPlatformType_TencentWb:
            imageName = @"UMS_tencent_icon";
            paltFormName = @"腾讯微博";
            break;
        case UMSocialPlatformType_Douban:
            imageName = @"UMS_douban_icon";
            paltFormName = @"豆瓣";
            break;
        case UMSocialPlatformType_Renren:
            imageName = @"UMS_renren_icon";
            paltFormName = @"人人";
            break;
        case UMSocialPlatformType_Email:
            imageName = @"UMS_email_icon";
            paltFormName = @"邮件";
            break;
        case UMSocialPlatformType_Sms:
            imageName = @"UMS_sms_icon";
            paltFormName = @"短信";
            break;
        case UMSocialPlatformType_Facebook:
            imageName = @"UMS_facebook_icon";
            paltFormName = @"Facebook";
            break;
        case UMSocialPlatformType_Twitter:
            imageName = @"UMS_twitter_icon";
            paltFormName = @"Twitter";
            break;
        case UMSocialPlatformType_Linkedin:
            imageName = @"UMS_linkedin_icon";
            paltFormName = @"Linkedin";
            break;
        default:
            break;
    }
    [dict setValue:UMSocialPlatformIconWithName(imageName) forKey:UMSAuthPlatformIconNameKey];////通过图片名称读取UMSocialSDKResources.bundle里的平台icon 全路径
    [dict setValue:paltFormName forKey:UMSAuthPlatformNameKey];
    return dict;
}

@end
