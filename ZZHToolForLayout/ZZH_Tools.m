//
//  ZZH_Tools.m
//  NewBioon
//
//  Created by zhangzhihua on 2017/5/25.
//  Copyright © 2017年 Bioon. All rights reserved.
//

#import "ZZH_Tools.h"
#define  USER_D [NSUserDefaults standardUserDefaults]
@interface ZZH_Tools()<UIAlertViewDelegate>


@end

@implementation ZZH_Tools
ZZH_Tools *selfTool;
+(instancetype)Default{
    if(!selfTool){
        selfTool = [[ZZH_Tools alloc]init];
    }
    return selfTool;
}


/**
 *
 *判断通知中心是否打开
 *如果没有打开那么弹出提示去跳转
 *如果打开了那么不做提示
 *
 */
#pragma  mark -
-(void)ShowAlertForCenterNotifactionwithWaittingTime:(NSInteger)waitTime{
    //判断是否发送通知
    NSDate *date = [NSDate date]; // 获得时间对象
    
    NSDateFormatter *forMatter = [[NSDateFormatter alloc] init];
    
    [forMatter setDateFormat:@"HH-mm-ss yyyy-MM-dd"];
    
    NSString *dateStr = [forMatter stringFromDate:date];
    
    @try {
        NSTimeInterval nowtime = [[NSDate date] timeIntervalSince1970];
        
        NSInteger theTime = [[NSNumber numberWithDouble:nowtime] integerValue];
        
        NSNumber *currentTimeString = [NSNumber numberWithInteger:theTime];
        NSLog(@"当前的时间为notifaction --- %@ -- %ld",dateStr,(long)theTime);
        
        //用当前时间和已经记录的时间对比
        NSNumber *oldtimeNumber = [USER_D objectForKey:@"notifaction_timeofNotifaction"];
        //第一次进入不进行跳转判断 默认的oldtimeNumber为0
        if([oldtimeNumber integerValue]<10){
            //储存当前的时间
            [USER_D setObject:currentTimeString forKey:@"notifaction_timeofNotifaction"];
            //第一次进入不进行跳转判断
            return;
        }
        
        //NSLog(@"当前的时间差  notifaction--- %ld",([currentTimeString integerValue] - [oldtimeNumber integerValue]));
        // 设置多长时间进行一次通知权限判断。
        if(([currentTimeString integerValue] - [oldtimeNumber integerValue])> 60*waitTime){
            [self judgmentSendNotifaction];
            //记录此次提示的时间点
            [USER_D setObject:currentTimeString forKey:@"notifaction_timeofNotifaction"];
            [USER_D synchronize];
            
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

#pragma  mark -

-(void)judgmentSendNotifaction{
    
    // 获取通知中心 是否 允许程序通知消息的值。
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0f) {
        
        UIAlertView *judgmentAlert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您尚未打开信息推送,是否打开推送设置获取第一手资讯？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"去打开", nil];
        judgmentAlert.tag = 2;
        [judgmentAlert show];
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (UIUserNotificationTypeNone == setting.types) {
            
        } else {
            NSLog(@"推送打开 8.0");
            
        }
    }
    else
    {
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        
        if(UIRemoteNotificationTypeNone == type){
            NSLog(@"推送关闭");
        }
        else
        {
            NSLog(@"推送打开");
        }
    }
}

#pragma mark -
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1){
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}


-(void)sutableSize:(UIView*)sutableView{
    @try {
        CGFloat viewWidth;
        if(isIPHONE5){
            viewWidth = 320.f;
        }else
        if(isIPHONE6){
            viewWidth = 375.f;
        }else
        if(isIPHONE6P){
            viewWidth = 414.f;
        }else{
            viewWidth = 375.f;
        }
        for(NSLayoutConstraint *con in sutableView.constraints){
            //        NSLog(@"con ... %@ --- %ld",con,(long)con.firstAttribute);
            if(con.firstAttribute == NSLayoutAttributeWidth){
                //            NSLog(@"找到了宽度");
                [sutableView removeConstraint:con];
                NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:sutableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:viewWidth];
                [sutableView addConstraint:widthConstraint];
            }
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

//setLeadding
-(void)setLeadding:(CGFloat)leftSpace andView:(UIView*)sutableView{
    @try {
        
        for(NSLayoutConstraint *con in sutableView.constraints){
            //        NSLog(@"con ... %@ --- %ld",con,(long)con.firstAttribute);
            if(con.firstAttribute == NSLayoutAttributeLeading){
                //            NSLog(@"找到了宽度");
                [sutableView removeConstraint:con];
                NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:sutableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:leftSpace];
                [sutableView addConstraint:widthConstraint];
            }
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

-(void)setTop:(CGFloat)leftSpace andView:(UIView*)sutableView fatherView:(UIView*)fatherView{
    @try {
        
        for(NSLayoutConstraint *con in sutableView.constraints){
                    NSLog(@"con ... %@ --- %ld",con,(long)con.firstAnchor);
            if(con.firstAttribute == NSLayoutAttributeTop){
                //            NSLog(@"找到了宽度");
                [sutableView removeConstraint:con];
                NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:sutableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:fatherView attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:leftSpace];
                [sutableView addConstraint:widthConstraint];
            }
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}



-(void)setHeight_heightValue:(CGFloat)height withView:(UIView*)sutableView{
    @try {
        for(NSLayoutConstraint *con in sutableView.constraints){
            if(con.firstAttribute == NSLayoutAttributeHeight){
                [sutableView removeConstraint:con];
                NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:sutableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:height];
                [sutableView addConstraint:widthConstraint];
            }
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}


/**
 *   参数说明
 *   appid
 *   跳转到APPStore的APP的ID
 *
 *   beShowViewController
 *   显示此弹框的ViewController
 *
 */
#pragma  mark -
-(void)GoAppStoreToCommentwithAppId:(NSString*)appid andShowViewController:(UIViewController*)beShowViewController withWaitTime:(NSInteger)waitTime{
    
    //判断是否发送通知
    NSDate *date = [NSDate date]; // 获得时间对象
    
    NSDateFormatter *forMatter = [[NSDateFormatter alloc] init];
    
    [forMatter setDateFormat:@"HH-mm-ss yyyy-MM-dd"];
    
    NSString *dateStr = [forMatter stringFromDate:date];
    
    @try {
        NSTimeInterval nowtime = [[NSDate date] timeIntervalSince1970];
        
        NSInteger theTime = [[NSNumber numberWithDouble:nowtime] integerValue];
        
        NSNumber *currentTimeString = [NSNumber numberWithInteger:theTime];
        NSLog(@"当前的时间为 --- %@ -- %ld",dateStr,(long)theTime);
        
        //用当前时间和已经记录的时间对比
        NSNumber *oldtimeNumber = [USER_D objectForKey:@"timeofNotifaction"];
        //第一次进入不进行跳转判断 默认的oldtimeNumber为0
        if([oldtimeNumber integerValue]<10){
            //储存当前的时间
            [USER_D setObject:currentTimeString forKey:@"timeofNotifaction"];
            //第一次进入不进行跳转判断
            return;
        }
        NSLog(@"当前的时间差--- %ld",([currentTimeString integerValue] - [oldtimeNumber integerValue]));
        // 设置多长时间进行一次通知权限判断。
        if(([currentTimeString integerValue] - [oldtimeNumber integerValue])> 60*waitTime){
            LBToAppStore *toAppStore = [[LBToAppStore alloc]init];
            toAppStore.myAppID =appid;
            [toAppStore showGotoAppStore:beShowViewController];
            //记录此次提示的时间点
            [USER_D setObject:currentTimeString forKey:@"timeofNotifaction"];
            [USER_D synchronize];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}





@end
