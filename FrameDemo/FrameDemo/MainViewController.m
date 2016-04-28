//
//  MainViewController.m
//  FrameDemo
//
//  Created by Gensound on 16/4/28.
//  Copyright © 2016年 Gensound. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
#import "twoViewController.h"
#import "ThreeViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];

    
    [self addChileVC];
    [self setTabbarColor];
}
- (void)setTabbarColor{
    UIView *backView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    backView.backgroundColor = [UIColor colorWithRed:13/255.0 green:184/255.0 blue:246/255.0 alpha:1];
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
}
- (void)addChileVC{
    [self addChildViewController:[[FirstViewController alloc] init] andTitle:@"第一个界面" andImgName:nil];
    [self addChildViewController:[[twoViewController alloc] init] andTitle:@"第二个界面" andImgName:nil];
    [self addChildViewController:[[ThreeViewController alloc] init] andTitle:@"第三个界面" andImgName:nil];
    
}

- (void)addChildViewController:(UIViewController *)vc andTitle:(NSString *)title andImgName:(NSString *)imgName{
    vc.title = title;
    
    self.tabBar.tintColor = [UIColor blackColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    nav.navigationBar.barTintColor = [UIColor colorWithRed:13/255.0 green:184/255.0 blue:246/255.0 alpha:1];//设置导航栏颜色
    
    
    
    [self addChildViewController:nav];
    
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
