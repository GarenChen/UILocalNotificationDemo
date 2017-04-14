//
//  GCLocalNotification.m
//  本地推送通知
//
//  Created by 陈广川 on 16/1/22.
//  Copyright © 2016年 陈广川. All rights reserved.
//

#import "GCLocalNotification.h"
#import <UserNotifications/UserNotifications.h>

#define catagory_id  @"catagory_id"

@implementation GCLocalNotification


/**
 *  设置通知
 */
+ (void)fireLocalNote {
    
    // 1.创建本地通知
    UILocalNotification *localNote = [[UILocalNotification alloc] init];
	
    // 2.设置本地通知的内容

    localNote.fireDate = [NSDate dateWithTimeIntervalSinceNow:6.0];
    // 2.2.设置通知的内容
    localNote.alertBody = @"吃饭了吗?";
	
    // 2.3.设置滑块的文字
    localNote.alertAction = @"快点";
	
//    // 2.4.决定alertAction是否生效
//    localNote.hasAction = NO;
	
    // 2.5.设置点击通知的启动图片
    localNote.alertLaunchImage = @"3213432dasf";
	
    // 2.6.设置alertTitle
	if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.2) {
		localNote.alertTitle = @"3333333333";
	}

    // 2.7.设置有通知时的音效
    localNote.soundName = @"buyao.wav";
	
    // 2.8.设置应用程序图标右上角的数字
    localNote.applicationIconBadgeNumber = 999;

    
    // 2.9.设置额外信息
    localNote.userInfo = @{@"type" : @"1"};

	localNote.category = catagory_id;
	
    [[UIApplication sharedApplication] scheduleLocalNotification:localNote];
    
}


/**
 *  注册通知
 */
+ (void)registerNotification {
	
	
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) {
		
		UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
		action1.identifier = @"action1";
		action1.title = @"action1";
		action1.activationMode = UIUserNotificationActivationModeBackground;
		action1.authenticationRequired = true;
		action1.destructive = false;
		
		UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];
		action2.identifier = @"action2";
		action2.title = @"action2";
		action2.activationMode = UIUserNotificationActivationModeForeground;
		action2.authenticationRequired = true;
		action2.destructive = true;
		
		UIMutableUserNotificationAction *action3 = [[UIMutableUserNotificationAction alloc] init];
		action3.identifier = @"action3";
		action3.title = @"action3";
		action3.activationMode = UIUserNotificationActivationModeBackground;
		action3.authenticationRequired = true;
		action3.behavior = UIUserNotificationActionBehaviorTextInput;
		action3.parameters = @{UIUserNotificationTextInputActionButtonTitleKey: @"action3 title",UIUserNotificationActionResponseTypedTextKey:@"action3 text"};
		action3.destructive = false;
		
		
		UIMutableUserNotificationCategory *catagory = [[UIMutableUserNotificationCategory alloc] init];
		catagory.identifier = catagory_id;
		[catagory setActions:@[action1, action2, action3] forContext:UIUserNotificationActionContextDefault];
		
        UIUserNotificationSettings *notiSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:[NSSet setWithObjects:catagory, nil]];
		
        [[UIApplication sharedApplication] registerUserNotificationSettings:notiSettings];
    }
}


// 取消某个本地推送通知
+ (void)cancelNotificationWithKey:(NSString *)key {
    
    NSArray *localNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
    for (UILocalNotification *notification in localNotifications) {
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo) {
            
            NSString *info = userInfo[@"type"];
            if ([info  isEqual: @"1"]) {
                [[UIApplication sharedApplication] cancelLocalNotification:notification];
            }
            
        }
    }
    
}


@end
