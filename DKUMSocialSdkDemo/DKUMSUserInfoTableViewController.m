//
//  DKUMSUserInfoTableViewController.m
//  DKUMSocialSdkDemo
//
//  Created by devzkn on 08/10/2016.
//  Copyright © 2016 DevKevin. All rights reserved.
//

#import "DKUMSUserInfoTableViewController.h"
#import <UMSocialCore/UMSocialCore.h>
#import "DKPlatformInfo.h"

@interface DKUMSUserInfoTableViewController ()

/**存储着包含：平台类型、平台名称、平台icon 字典的数组     数据源*/
@property (nonatomic, strong) NSMutableArray *platformInfoArray;

@end

@implementation DKUMSUserInfoTableViewController

- (NSMutableArray *)platformInfoArray{
    if (nil == _platformInfoArray) {
        _platformInfoArray = [DKPlatformInfo platformInfolist];
    }
    return _platformInfoArray;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.platformInfoArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    DKPlatformInfo *info = self.platformInfoArray[indexPath.row];
    cell.textLabel.text = info.paltFormName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DKPlatformInfo *info = self.platformInfoArray[indexPath.row];
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:info.platformType currentViewController:self completion:^(id result, NSError *error) {
        UMSocialUserInfoResponse *userinfo =result;
        NSString *message = [NSString stringWithFormat:@"name: %@\n icon: %@\n gender: %@\n",userinfo.name,userinfo.iconurl,userinfo.gender];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UserInfo"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }];
}






@end
