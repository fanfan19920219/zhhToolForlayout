//
//  ZZH_Tools.h
//  NewBioon
//
//  Created by zhangzhihua on 2017/5/25.
//  Copyright © 2017年 Bioon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LBToAppStore.h"

#define isIPHONE4S ([UIScreen mainScreen].bounds.size.height == 480.0)
#define isIPHONE5 ([UIScreen mainScreen].bounds.size.height == 568.0)
#define isIPHONE6 ([UIScreen mainScreen].bounds.size.height == 667.0)
#define isIPHONE6P ([UIScreen mainScreen].bounds.size.height == 736.0)


@interface ZZH_Tools : NSObject

//调用单利方法
+(instancetype)Default;

/**
 *
 *判断通知中心是否打开
 *如果没有打开那么弹出提示去跳转
 *如果打开了那么不做提示
 *
 */
-(void)ShowAlertForCenterNotifactionwithWaittingTime:(NSInteger)waitTime;


/**
 *   参数说明
 *   appid
 *   跳转到APPStore的APP的ID
 *
 *   beShowViewController
 *   显示此弹框的ViewController
 *
 */

-(void)GoAppStoreToCommentwithAppId:(NSString*)appid andShowViewController:(UIViewController*)beShowViewController withWaitTime:(NSInteger)waitTime;

-(void)sutableSize:(UIView*)sutableView;

-(void)setHeight_heightValue:(CGFloat)height withView:(UIView*)sutableView;

-(void)setLeadding:(CGFloat)leftSpace andView:(UIView*)sutableView;

//-(void)setTop:(CGFloat)leftSpace andView:(UIView*)sutableView;

-(void)setTop:(CGFloat)leftSpace andView:(UIView*)sutableView fatherView:(UIView*)fatherView;

@end
