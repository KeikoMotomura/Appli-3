//
//  ViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/05.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.



#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
    
    self.titleImageView.image = [UIImage imageNamed:@"englishexercise.png"];
    
    [self.startBtn setImage:[UIImage imageNamed:@"startBtn.png"]
                 forState:UIControlStateNormal];
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}





@end
