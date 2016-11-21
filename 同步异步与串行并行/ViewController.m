//
//  ViewController.m
//  同步异步与串行并行
//
//  Created by wangchangyang on 2016/11/21.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(method) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

- (void)method {
    dispatch_queue_t serialQueue = dispatch_queue_create("xxx", DISPATCH_QUEUE_SERIAL);
    
    // 当 串行队列 为 dispatch_get_main_queue() 时，使用 同步串行队列会造成死锁，当为自己创建的 串行队列时，不会造成死锁
    
    NSLog(@"01");
    dispatch_sync(serialQueue, ^{
        for (NSUInteger i = 0; i < 10; i++) {
            NSLog(@"101：%@：%@", @(i), [NSThread currentThread]);
        }
    });
    NSLog(@"02");
    dispatch_sync(serialQueue, ^{
        for (NSUInteger i = 0; i < 10; i++) {
            NSLog(@"102：%@：%@", @(i), [NSThread currentThread]);
        }
    });
    NSLog(@"03");
    NSLog(@"————————————————————————");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
