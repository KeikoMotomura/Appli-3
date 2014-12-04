//
//  resultViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/11.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import "resultViewController.h"

@interface resultViewController ()

@end

@implementation resultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"resultViewController";
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];  // バーアイテムカラー
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
    
    
    
    
    
    self.select_correctanswerNo = self.select_correctanswerNo;
    NSLog(@"正解数@%d", self.select_correctanswerNo);
    
    switch (self.select_correctanswerNo) {
        case 0:
            //        case 1:
            //        case 2:
            //        case 3:
            //        case 4:
            self.resultLabel.text = @"パンケーキをどうぞ";
            self.resultImage.image = [UIImage imageNamed:@"pancake.gif"];
            break;
            
        case 1:
            //        case 6:
            //        case 7:
            self.resultLabel.text = @"カップケーキをどうぞ";
            self.resultImage.image = [UIImage imageNamed:@"cupcake.gif"];
            break;
            
        case 2:
            //        case 9:
            self.resultLabel.text = @"スペシャルケーキをどうぞ";
            self.resultImage.image = [UIImage imageNamed:@"specialcake.gif"];
            break;
            
        case 3:
            self.resultLabel.text = @"パーフェクト！";
            self.resultImage.image = [UIImage imageNamed:@"perfectcake.gif"];
            break;
            
            
    }
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)topbackBtn:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end
