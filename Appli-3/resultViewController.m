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
    

    

    
    NSInteger correctanswer = 3;
    
    // keyNameという名前でhoge(数値)を保存する
//    [[NSUserDefaults standardUserDefaults] setInteger:correctanswer forKey:@"keyName"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    // 保存した物を取り出す
//    NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"keyName"];
//    NSInteger integer = [[NSUserDefaults standardUserDefaults] integerForKey:@"keyName"];
    
    switch (correctanswer) {
        case 0:
        case 1:
            self.resultLabel.text = @"パンケーキをどうぞ";
            self.resultImage.image = [UIImage imageNamed:@"pancake.gif"];
            break;

        case 2:
            self.resultLabel.text = @"カップケーキをどうぞ";
            self.resultImage.image = [UIImage imageNamed:@"cupcake.gif"];
            break;
            
        case 3:
            self.resultLabel.text = @"スペシャルケーキをどうぞ";
            self.resultImage.image = [UIImage imageNamed:@"specialcake.gif"];
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
