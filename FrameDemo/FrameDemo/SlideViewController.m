//
//  SlideViewController.m
//  FrameDemo
//
//  Created by Gensound on 16/4/28.
//  Copyright © 2016年 Gensound. All rights reserved.
//

#import "SlideViewController.h"
#import "UserInfoViewController.h"

@interface SlideViewController ()

@end

@implementation SlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 300, 100, 50);
    [button setTitle:@"编辑资料" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor lightGrayColor];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)click{
    NSLog(@"点击了");
    UserInfoViewController *view = [[UserInfoViewController alloc] init];
    [self presentViewController:view animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
