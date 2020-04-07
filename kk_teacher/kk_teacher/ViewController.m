//
//  ViewController.m
//  kk_teacher
//
//  Created by yuhanglv on 2020/4/7.
//  Copyright © 2020 yuhanglv. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)flutterAction:(id)sender {
    
    FlutterViewController* vc = [[FlutterViewController alloc] init];
    [vc setInitialRoute:@"helloPage"];
    vc.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:vc animated:YES];
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
