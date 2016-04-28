//
//  ViewController.m
//  FrameDemo
//
//  Created by Gensound on 16/4/28.
//  Copyright © 2016年 Gensound. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "SlideViewController.h"

@interface ViewController ()

@property (strong,nonatomic) UIPanGestureRecognizer *drag;//拖拽手势

@property (strong,nonatomic) UITapGestureRecognizer *tap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSlide];
    
    [self addpan];//添加手势
    
}

- (void)addMain{

    
    MainViewController *mainView = [[MainViewController alloc] init];
    mainView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self addChildViewController:mainView];
    [self.view addSubview:mainView.view];

}
- (void)addSlide{
    SlideViewController *slideView = [[SlideViewController alloc] init];
    slideView.view.frame = CGRectMake(0, 0, self.view.frame.size.width*0.75, self.view.frame.size.height);
    [self addChildViewController:slideView];
    [self.view addSubview:slideView.view];
    
    
    [self addMain];
}
- (void)addpan{
    self.drag = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(tapDrag:)];
    [self.view addGestureRecognizer:_drag];
}
//处理拖拽手势
- (void)tapDrag:(UIPanGestureRecognizer *)sender{
    NSLog(@"xxx");
    //获取手指拖拽的时候，平移的值
    CGPoint translation = [sender translationInView:[sender.view.subviews objectAtIndex:3]];
    
    //让当前控件做响应的平移
    [sender.view.subviews objectAtIndex:3].transform = CGAffineTransformTranslate([sender.view.subviews objectAtIndex:3].transform, translation.x, 0);//view随手指移动
    //每次识别完之后，让平移的值不叠加
    [sender setTranslation:CGPointZero inView:[self.view.subviews objectAtIndex:3]];
    
    //到最右边的距离
    CGAffineTransform rightScopeTrasnform = CGAffineTransformTranslate(self.view.transform, [UIScreen mainScreen].bounds.size.width*0.75, 0);
    
    //当移动到右边极限时
    if ([self.view.subviews objectAtIndex:3].transform.tx > rightScopeTrasnform.tx) {
        
        //限制最右边的范围
        [self.view.subviews objectAtIndex:3].transform = rightScopeTrasnform;
        
        //移动到最右边的时候，给视图添加点击手势，点击一下就会自动返回主界面
    }else if ([self.view.subviews objectAtIndex:3].transform.tx < 0.0){//移动到左边时
        //限制最左边的范围
        [self.view.subviews objectAtIndex:3].transform = CGAffineTransformTranslate(self.view.transform, 0, 0);
        
        
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0/2 animations:^{
            //如果拖拽距离大于一般宽度就自动滑动到最右边
            if ([self.view.subviews objectAtIndex:3].frame.origin.x > [UIScreen mainScreen].bounds.size.width*0.5) {
                [self.view.subviews objectAtIndex:3].transform = rightScopeTrasnform;
                [self addTap];//
            }else{
                [self.view.subviews objectAtIndex:3].transform =CGAffineTransformIdentity;
                
                [[self.view.subviews objectAtIndex:3] removeGestureRecognizer:_tap];
                NSLog(@"移除手势");
            }
        }];
    }
    
    
}

- (void)addTap{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    self.tap = tap;
    [[self.view.subviews objectAtIndex:3] addGestureRecognizer:_tap];
    NSLog(@"添加了手势");
    
}
- (void)tap:(UITapGestureRecognizer *)click{
    //触发点击事件，返回主界面
    [UIView animateWithDuration:0.3 animations:^{
        [self.view.subviews objectAtIndex:3].transform = CGAffineTransformIdentity;
        
        //返回主界面后，移除添加的手势
        [[self.view.subviews objectAtIndex:3] removeGestureRecognizer:_tap];
        NSLog(@"Remo手势");
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
