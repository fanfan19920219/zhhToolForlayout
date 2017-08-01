//
//  ViewController.m
//  ZZHToolForLayout
//
//  Created by zhangzhihua on 2017/8/1.
//  Copyright © 2017年 zhangzhihua. All rights reserved.
//

#import "ViewController.h"
//nihao
/**
 本文讲的是把Git在最新2.9.2，合并pull两个不同的项目，出现的问题如何去解决fatal: refusing to merge unrelated histories
 
 我在Github新建一个仓库，写了License，然后把本地一个写了很久仓库上传。
 
 先pull，因为两个仓库不同，发现refusing to merge unrelated histories，无法pull
 
 因为他们是两个不同的项目，要把两个不同的项目合并，git需要添加一句代码，在git pull，这句代码是在git 2.9.2版本发生的，最新的版本需要添加--allow-unrelated-histories
 
 假如我们的源是origin，分支是master，那么我们 需要这样写git pull origin master ----allow-unrelated-histories需要知道，我们的源可以是本地的路径
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end



