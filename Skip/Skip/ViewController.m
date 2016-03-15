//
//  ViewController.m
//  Skip
//
//  Created by PerryJi on 16/3/15.
//  Copyright © 2016年 PerryJi. All rights reserved.
//

#import "ViewController.h"

//关于本机
#define ABOUT @"prefs:root=General&path=About"
//辅助功能
#define ACCESSIBILITY @"prefs:root=General&path=ACCESSIBILITY"
//飞行模式 已失效
#define AIRPLANE @"prefs:root=AIRPLANE_MODE"
//自动锁定设置
#define AUTOLOCK @"prefs:root=General&path=AUTOLOCK"
#define BRIGHTNESS @"prefs:root=Brightness"
//通用
#define BLUETOOTH @"prefs:root=Bluetooth"
//日期与实践设置
#define DATETIME @"prefs:root=General&path=DATE_AND_TIME"
//FaceTime
#define FACETIME @"prefs:root=FACETIME"

#define GENERAL @"prefs:root=General"
#define KEYBOARD @"prefs:root=General&path=Keyboard"
#define ICLOUD @"prefs:root=CASTLE"
#define iCloudStorage @"prefs:root=castle&path=STORAGE_AND_BACKUP"
//语言与地区
#define International @"prefs:root=General&path=INTERNATIONAL"
//定位服务
#define LocationServices @"prefs:root=LOCATION_SERVICES"
#define Music @"prefs:root=MUSIC"
#define MusicEqualizer @"prefs:root=MUSIC&path=EQ"
#define MusicVolumeLimit @"prefs:root=MUSIC&path=VolumeLimit"
#define Network @"prefs:root=General&path=Network"
#define NikeiPod @"prefs:root=NIKE_PLUS_IPOD"
#define Notes @"prefs:root=NOTES"
//通知
#define Notification @"prefs:root=NOTIFICATIONS_ID"

#define Phone @"prefs:root=Phone"
#define Photos @"prefs:root=Photos"
//描述文件
#define Profile @"prefs:root=General&path=ManagedConfigurationList"
//还原设置
#define Reset @"prefs:root=General&path=Reset"
#define Safari @"prefs:root=Safari"
#define Siri @"prefs:root=General&path=Assistant"
//声音
#define Sounds @"prefs:root=Sounds"
//检查更新
#define SoftwareUpdate @"prefs:root=General&path=SOFTWARE_UPDATE_LINK"
//Apple ID设置
#define Store @"prefs:root=STORE"
//用量
#define Usage @"prefs:root=General&path=USAGE"
#define WiFi @"prefs:root=WIFI"

#define IOS8Later (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1)


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelectorOnMainThread:@selector(skipTest) withObject:nil waitUntilDone:NO];
    
}
- (void)skipTest {
    //跳转至系统设置具体某一个界面，最简单的方法是将设备语言修改为英文，直接拼接prefs地址就OK了
    [self alertWithTarget:self Title:@"SkipTest" content:nil confirmTitle:@"确定" cancelTitle:@"取消" cancelBlock:NULL confirmBlock:^{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:BLUETOOTH]];
    }];
}
- (void)alertWithTarget:(UIViewController *)target
                  Title:(NSString *)title
                content:(NSString *)content
           confirmTitle:(NSString *)confirmTitle
            cancelTitle:(NSString *)cancelTitle
            cancelBlock:(dispatch_block_t)cancelBlock
           confirmBlock:(dispatch_block_t)confirmBlock {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:title
                                          message:content
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    if(cancelTitle.length > 0){
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:cancelTitle
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action) {
                                           if(cancelBlock){
                                               cancelBlock();
                                           }
                                       }];
        [alertController  addAction:cancelAction];
    }
    
    UIAlertAction *confirmAction = [UIAlertAction
                                    actionWithTitle:confirmTitle
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {
                                        if(confirmBlock){
                                            confirmBlock();
                                        }
                                    }];
    [alertController  addAction:confirmAction];
    
    [target presentViewController:alertController animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
