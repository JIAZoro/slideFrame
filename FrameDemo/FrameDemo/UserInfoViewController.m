//
//  UserInfoViewController.m
//  FrameDemo
//
//  Created by Gensound on 16/4/28.
//  Copyright © 2016年 Gensound. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];

    [self addDisButton];
    
    // Do any additional setup after loading the view.
}
- (void)addDisButton{
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    back.frame = CGRectMake(0, 100, 50, 50);
    [back setTitle:@"back" forState:UIControlStateNormal];
    [self.view addSubview:back];
    
}
- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];

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
