//
//  resultViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/11.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//
//＊＊やりたいこと
//正解数によって表示させるメッセージと画像を変える

#import "resultViewController.h"

@interface resultViewController ()

@end

@implementation resultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"resultViewController";
    
    self.resultLabel.text = @"正解数に応じて三種類のメッセージを表示";
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)topbackBtn:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}
@end
