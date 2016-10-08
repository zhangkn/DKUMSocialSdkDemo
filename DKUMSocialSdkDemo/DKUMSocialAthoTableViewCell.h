//
//  DKUMSocialAthoTableViewCell.h
//  DKUMSocialSdkDemo
//
//  Created by devzkn on 08/10/2016.
//  Copyright © 2016 DevKevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DKPlatformInfo.h"

@interface DKUMSocialAthoTableViewCell : UITableViewCell
/** 点击开关执行的代码*/
@property (nonatomic, copy) void (^switchAction)(UISwitch *platformSwitch, NSInteger platformType);

//自定义视图的现实的数据来源于模型，即使用模型装配自定义视图的显示内容
@property (nonatomic,strong) DKPlatformInfo *platformInfo;//视图对应的模型，是视图提供给外界的接口
//@property (nonatomic, assign) NSInteger platformType;
+ (instancetype) tableViewCellWithTableView:(UITableView *) view;//
/**
 通过数据模型设置视图内容，可以让视图控制器不需要了解视图的细节
 */
+ (instancetype) tableVieCellWithPlatformInfo:(DKPlatformInfo *) platformInfo tableView:(UITableView *)tableView;//


@end

