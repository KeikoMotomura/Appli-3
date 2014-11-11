//
//  note3ViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.

//＊＊やりたいこと＊＊
//ラベルにnote2ViewControllerでタップされた単語を表示する
//テキストビューにnote2ViewControllerでタップされた単語を表示する
//（テキストビューで大丈夫か？）

#import "note3ViewController.h"

@interface note3ViewController ()

@end

@implementation note3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.note3Label.text = @"ここに単語を表示";
    
    
    
//    self.note3Label.text = [NSString stringWithFormat:@"%@",ここになにか[self.select_num]];
    
    
    self.wordjumpLabel.text = @"OFFにすると単語帳から削除できます";
    
   
    
    
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

- (IBAction)wordjumpSwitch:(id)sender {
    
    NSLog(@"スイッチが切り替わりました");
    
//    スイッチがOFFになったら単語帳から外す、ONになったら再度単語帳に登録できるようにする。
    
    
}
@end
