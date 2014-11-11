//
//  answerViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.

//＊＊やりたいこと＊＊
//回答画面は二種類（正解時と不正解時▶︎４つの選択肢のうち１つだけタップされたら正解画面、３つは不正解画面に遷移する）



#import "answerViewController.h"
#import "ViewController.h"
#import "menuViewController.h"
#import "questionViewController.h"


@interface answerViewController ()

@end

@implementation answerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"kotae");
    
    _answerArray = @[@{@"name":@"単語",@"desc":@"説明文"},@{@"name":@"単語",@"desc":@"説明文"},@{@"name":@"単語",@"desc":@"説明文"},@{@"name":@"単語",@"desc":@"説明文"}];
                   
                     
    self.answerTextView.text = [NSString stringWithFormat:@"%@%@",_answerArray[self.select_num][@"name"],_answerArray[self.select_num][@"desc"]];
   
    self.wordjumpLabel.text = @"単語帳に登録";
    
    
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
    
    if(self.wordjumpSwitch.on){
        
        //単語帳に登録する
        NSLog(@"スイッチがONになりました");
       
        
    }else{
        
        //単語帳から削除する
        NSLog(@"スイッチがOFFになりました");
      
        
}
    
       
}

- (IBAction)menubackBtn:(id)sender {
    
    NSLog(@"問題種類へ戻るボタンがタップされました");
    
    // 次画面を指定して遷移
    menuViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"menuViewController"];
    
    //    ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]
     pushViewController:dvc animated:YES];

}

- (IBAction)topbackBtn:(id)sender {
    
    NSInteger count       = self.navigationController.viewControllers.count - 4;
    ViewController *vc = [self.navigationController.viewControllers objectAtIndex:count];
    [self.navigationController popToViewController:vc animated:YES];

}

//  「次の問題へ」ボタンが押されたら次のquestion画面が開く　＊＊問題種類がすべてPhrasalVerbになってしまう。
- (IBAction)nextBtn:(id)sender {
    
    NSLog(@"次の問題へボタンが押されました");
    
    // 次画面を指定して遷移
    questionViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"questionViewController"];
    
    //    ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]
     pushViewController:dvc animated:YES];
    
}



@end
