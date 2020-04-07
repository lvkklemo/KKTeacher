//
//  ViewController.m
//  kk_teacher
//
//  Created by yuhanglv on 2020/4/7.
//  Copyright © 2020 yuhanglv. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>

@interface ViewController ()<FlutterStreamHandler>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)flutterAction:(id)sender {
    
    FlutterViewController* fluttervc = [[FlutterViewController alloc] init];
    [fluttervc setInitialRoute:@"helloPage"];
    
    [fluttervc setTitle:@"Flutter"];
    NSString * chanelName = @"com.pages.your/native_get";
    FlutterMethodChannel *methodChanel = [FlutterMethodChannel methodChannelWithName:chanelName binaryMessenger:fluttervc];
    
    [methodChanel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
            // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
            // result 是给flutter的回调， 该回调只能使用一次
            NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
        if ([call.method isEqualToString:@"iOSFlutter"]) {
            [fluttervc popRoute];
        }
    }];
    
    
    // 要与main.dart中一致
    NSString *channelName = @"com.pages.your/native_post";
       
    FlutterEventChannel *evenChannal = [FlutterEventChannel eventChannelWithName:channelName binaryMessenger:fluttervc];
    // 代理FlutterStreamHandler
    [evenChannal setStreamHandler:self];
    
    [self.navigationController pushViewController:fluttervc animated:YES];
}

#pragma mark handle
- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events{
    
    NSLog(@"arguments%@",arguments);
    if (events) {
        events(@"push值给flutter");
    }
    return nil;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
@end
