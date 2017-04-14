//
//  AppDelegate.m
//  本地推送通知
//
//  Created by 陈广川 on 16/1/22.
//  Copyright © 2016年 陈广川. All rights reserved.
//

#import "AppDelegate.h"
#import "GCLocalNotification.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //ios8以上需要注册通知
    [GCLocalNotification registerNotification];

    // 界面的跳转(针对应用程序被杀死的状态下的跳转)
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        // 跳转代码
		
		NSLog(@"launchOptions : %@",launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]);
		
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"接收到本地通知" message:@"这是通过本地推送来启动app" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
		[alertView show];
    }

    return YES;
}

/*
 应用程序在进入前台,或者在前台的时候都会执行该方法
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{

	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"接收到本地通知" message:notification.alertBody delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
	[alertView show];
}

//ios8
- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler {
	
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:identifier message:notification.alertBody delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
	[alertView show];
	
	completionHandler();
}

//ios9
-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void (^)())completionHandler {
	
	
	NSString *dec = [NSString stringWithFormat:@"text:%@",responseInfo[UIUserNotificationActionResponseTypedTextKey]];
	
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:identifier message:dec delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
	[alertView show];
	
	completionHandler();
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
