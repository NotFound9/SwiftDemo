//
//  ViewControllerTwo.m
//  GestureDemo
//
//  Created by ruiwendaier on 2019/3/28.
//  Copyright © 2019年 Not Found. All rights reserved.
//

#import "ViewControllerTwo.h"

@interface ViewControllerTwo ()<UIGestureRecognizerDelegate>

@end

@implementation ViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 200/2, 200, 200, 200)];
    customView.backgroundColor = [UIColor whiteColor];
    UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    press.minimumPressDuration = 0.5;
    [customView addGestureRecognizer:press];
    press.delegate = self;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [customView addGestureRecognizer:pan];
    [self.view addSubview:customView];
}
-(void)longPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    NSLog(@"长按手势触发");
    gestureRecognizer.view.backgroundColor = gestureRecognizer.state == UIGestureRecognizerStateChanged ? UIColor.redColor : [UIColor whiteColor];
}
-(void)pan:(UIPanGestureRecognizer *)gestureRecognizer {
    NSLog(@"拖动手势触发");
    CGPoint point = [gestureRecognizer translationInView:gestureRecognizer.view];
    gestureRecognizer.view.transform =CGAffineTransformTranslate(gestureRecognizer.view.transform, point.x, point.y);
    [gestureRecognizer setTranslation:CGPointZero inView:gestureRecognizer.view];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)other {
    if ([gestureRecognizer isMemberOfClass:[UILongPressGestureRecognizer class]]) {
        return YES;
    }
    return NO;
}

@end
