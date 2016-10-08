//
//  DKUMSLoginTableViewController.m
//  DKUMSocialSdkDemo
//
//  Created by devzkn on 08/10/2016.
//  Copyright © 2016 DevKevin. All rights reserved.
//

#import "DKUMSLoginTableViewController.h"
#import "DKUMSocialAthoTableViewCell.h"
#import "DKConst.h"
#import "DKPlatformInfo.h"
//#define UMSAuthPlatformTypeKey @"UMSAuthPlatformTypeKey"
//#define UMSAuthPlatformNameKey @"UMSAuthPlatformNameKey" 
//#define UMSAuthPlatformIconNameKey @"UMSAuthPlatformImageNameKey"

@interface DKUMSLoginTableViewController ()
/**存储着包含：平台类型、平台名称、平台icon 字典的数组     数据源*/
@property (nonatomic, strong) NSMutableArray *platformInfoArray;

@end


@implementation DKUMSLoginTableViewController

- (NSMutableArray *)platformInfoArray{
    if (nil == _platformInfoArray) {
        _platformInfoArray = [DKPlatformInfo platformInfolist];
    }
    return _platformInfoArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tableview的cell类型
    [self.tableView registerClass:[DKUMSocialAthoTableViewCell class] forCellReuseIdentifier:DKUMSocialAthoTableViewCellId];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.platformInfoArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DKPlatformInfo *info = self.platformInfoArray[indexPath.row];
    DKUMSocialAthoTableViewCell *cell = [DKUMSocialAthoTableViewCell tableVieCellWithPlatformInfo:info tableView:tableView];
    
    __weak typeof(self) weakSelf = self;
    //定义 点击开关执行的block代码
    cell.switchAction = ^(UISwitch *platformSwitch, UMSocialPlatformType platformType){
        [weakSelf switchActionWith:platformSwitch platformType:platformType];
    };
    
    return cell;
}


/**     //定义 点击开关执行的block代码 辅助方法*/
-(void)switchActionWith:(UISwitch *)platformSwitch platformType:(UMSocialPlatformType)platformType
{
    if (platformSwitch.isOn) {
        [[UMSocialManager defaultManager]  authWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
            [self.tableView reloadData];
            UMSocialAuthResponse *authresponse = result;
            NSString *message = [NSString stringWithFormat:@"result: %d\n uid: %@\n accessToken: %@\n",(int)error.code,authresponse.uid,authresponse.accessToken];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login"
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                  otherButtonTitles:nil];
            [alert show];
        }];
    }else{
        [[UMSocialManager defaultManager] cancelAuthWithPlatform:platformType completion:^(id result, NSError *error) {
            if (!error) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"取消授权"
                                                                message:@"取消授权成功"
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
                [alert show];
            }
            [self.tableView reloadData];
        }];
    }
    
    
}



@end


