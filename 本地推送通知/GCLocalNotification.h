//
//  GCLocalNotification.h
//  本地推送通知
//
//  Created by 陈广川 on 16/1/22.
//  Copyright © 2016年 陈广川. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GCLocalNotification : NSObject

+ (void)fireLocalNote;

+ (void)registerNotification;

@end
