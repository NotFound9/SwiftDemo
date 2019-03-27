//
//  ViewController.m
//  GestureDemo
//
//  Created by ruiwendaier on 2019/3/13.
//  Copyright © 2019年 Not Found. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapOnce = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnce:)];
    tapOnce.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapOnce];
    UITapGestureRecognizer *tapTwice = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTwice:)];
    tapTwice.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tapTwice];
    //当tapTwice手势触发失败时才会触发tapOnce手势
    [tapOnce requireGestureRecognizerToFail:tapTwice];
}


-(void)tapOnce:(UITapGestureRecognizer *)tap
{
    NSLog(@"单击手势触发");
}

-(void)tapTwice:(UITapGestureRecognizer *)tap
{
    NSLog(@"双击手势触发");
}

@end
