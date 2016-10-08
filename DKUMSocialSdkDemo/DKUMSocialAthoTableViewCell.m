//
//  DKUMSocialAthoTableViewCell.m
//  DKUMSocialSdkDemo
//
//  Created by devzkn on 08/10/2016.
//  Copyright © 2016 DevKevin. All rights reserved.
//

#import "DKUMSocialAthoTableViewCell.h"
#import "DKConst.h"
@interface DKUMSocialAthoTableViewCell ()
/** 授权开关*/
@property (nonatomic, weak) UISwitch *platformSwitch;

@end
@implementation DKUMSocialAthoTableViewCell

+ (instancetype)tableViewCellWithTableView:(UITableView *)view{
    
    DKUMSocialAthoTableViewCell *cell = [view dequeueReusableCellWithIdentifier:DKUMSocialAthoTableViewCellId];
    if (cell == nil) {
        cell = [[DKUMSocialAthoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DKUMSocialAthoTableViewCellId];
    }
    return cell;
}

+(instancetype)tableVieCellWithPlatformInfo:(DKPlatformInfo *)platformInfo tableView:(UITableView *)tableView{
    DKUMSocialAthoTableViewCell *cell = [DKUMSocialAthoTableViewCell tableViewCellWithTableView:tableView];
    cell.platformInfo = platformInfo;
    return cell;
}

- (void)setPlatformInfo:(DKPlatformInfo *)platformInfo{
    _platformInfo = platformInfo;
    //装配数据
    [self setupSubViewData];
}

- (void)setupSubViewData{
    //查看是否已经授权
    self.platformSwitch.on = [self checkIsLogin:self.platformInfo.platformType];
    self.textLabel.text = self.platformInfo.paltFormName;
}
/**辅助方法 */
-(BOOL)checkIsLogin:(UMSocialPlatformType)platformType{
    if ([[UMSocialDataManager defaultManager] isAuth:platformType]) {
        return YES;
    }else{
        return NO;
    }
}

- (UISwitch *)platformSwitch{
    if (nil == _platformSwitch) {
        UISwitch *tmpView = [[UISwitch alloc]init];
        _platformSwitch = tmpView;
        [tmpView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        self.accessoryView = self.platformSwitch;//定义辅助开关
    }
    return _platformSwitch;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置自己的个性属性
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //构建内部控件
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView{
    self.platformSwitch.frame = CGRectMake(200, 5, 80, 20);
}

/** 处理授权开关*/
- (void)switchAction:(UISwitch *)sender
{
    if (self.switchAction) {
        //执行block
        self.switchAction(self.platformSwitch, self.platformInfo.platformType);
    }
}


@end
