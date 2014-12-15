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
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.796 green:0.084 blue:0.532 alpha:1.000];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
    
    
    self.select_correctanswerNo = self.select_correctanswerNo;
    NSLog(@"正解数@%d", self.select_correctanswerNo);
    
    
    switch (self.select_correctanswerNo) {
        case 0:
            self.resultLabel.text = @"ファイト！ ０問正解";
            self.resultLabel.textColor = [UIColor blueColor];
            self.resultImage.image = [UIImage imageNamed:@"0correct.png"];
            break;
            
        case 1:
            self.resultLabel.text = @"ファイト！ １問正解";
            self.resultLabel.textColor = [UIColor blueColor];
            self.resultImage.image = [UIImage imageNamed:@"1correct.png"];
            break;
            
        case 2:
            self.resultLabel.text = @"次は行ける！ ２問正解";
            self.resultLabel.textColor = [UIColor blueColor];
            self.resultImage.image = [UIImage imageNamed:@"2correct.png"];
            break;
            
        case 3:
            self.resultLabel.text = @"次は行ける！ ３問正解";
            self.resultLabel.textColor = [UIColor blueColor];
            self.resultImage.image = [UIImage imageNamed:@"3correct.png"];
            break;
            
        case 4:
            self.resultLabel.text = @"もう少し！ ４問正解";
            self.resultLabel.textColor = [UIColor blueColor];
            self.resultImage.image = [UIImage imageNamed:@"4correct.png"];
            break;
            
        case 5:
            self.resultLabel.text = @"なかなか！ ５問正解";
            self.resultLabel.textColor = [UIColor blueColor];
            self.resultImage.image = [UIImage imageNamed:@"5correct.png"];
            break;
            
        case 6:
            self.resultLabel.text = @"なかなか！ ６問正解";
            self.resultLabel.textColor = [UIColor blueColor];
            self.resultImage.image = [UIImage imageNamed:@"6correct.png"];
            break;
            
        case 7:
            self.resultLabel.text = @"おめでとう！ ７問正解";
            self.resultLabel.textColor = [UIColor blueColor];
            self.resultImage.image = [UIImage imageNamed:@"7correct.png"];
            break;
            
        case 8:
            self.resultLabel.text = @"おめでとう！ ８問正解";
            self.resultLabel.textColor = [UIColor blueColor];
            self.resultImage.image = [UIImage imageNamed:@"8correct.png"];
            break;
            
        case 9:
            self.resultLabel.text = @"おめでとう！ ９問正解";
            self.resultLabel.textColor = [UIColor blueColor];
            self.resultImage.image = [UIImage imageNamed:@"9correct.png"];
            break;
            
        case 10:
            self.resultLabel.text = @"パーフェクト！！";
            self.resultLabel.textColor = [UIColor blueColor];
            self.resultImage.image = [UIImage imageNamed:@"10correct.png"];
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
