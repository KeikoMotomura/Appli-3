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
#import "resultViewController.h"


@interface answerViewController ()

@end

@implementation answerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"answerViewController";
    
    NSLog(@"kotae");
    
    _answerArray = @[@{@"name":@"単語",@"desc":@"説明文"},@{@"name":@"単語",@"desc":@"説明文"},@{@"name":@"単語",@"desc":@"説明文"},@{@"name":@"単語",@"desc":@"説明文"}];
                   
                     
    self.answerTextView.text = [NSString stringWithFormat:@"%@%@",_answerArray[self.select_categoryNo][@"name"],_answerArray[self.select_categoryNo][@"desc"]];
   
    self.wordjumpLabel.text = @"単語帳に登録";
    
    
    [self _createnextButton];

    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    


}

-(void) _createnextButton{
    
    //  ボタンの位置を決定
    _nextButton = [[UIButton alloc] initWithFrame:CGRectMake (200, 550, 100, 10)];
    
    //  ボタンに表示する文字を指定
    [_nextButton setTitle:@"次の問題へ" forState:UIControlStateNormal];
    
    if (self.select_questionNo == 10) {
        NSLog(@"問題カウント数10になりました");
        
    //  ボタンに表示する文字を指定
        [_nextButton setTitle:@"結果を見る" forState:UIControlStateNormal];
        
    }
    

    //  ボタンの色を指定
    [_nextButton setTitleColor:[UIColor blueColor]forState:UIControlStateNormal];
    
    //  ボタンを表示している
    [self.view addSubview: _nextButton];
    
    [_nextButton addTarget:self action:@selector(tapButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
    //   ボタンをタップしたときに反応
-(void)tapButton{

    //  「次の問題へ」ボタンが押されたら次のquestion画面が開く
    NSLog(@"次の問題へボタンが押されました");
    
    //  次画面を指定して遷移
    questionViewController *qvc = [self.storyboard instantiateViewControllerWithIdentifier:@"questionViewController"];
    
    
    //  questionViewからわたってきたself.select numをここに代入＝ここを入れることで値が前の選択したものを覚えている
    //    Synonymなら１だな。Twomeaningなら３だな。
    qvc.select_categoryNo = self.select_categoryNo;
    
    //    ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]
     pushViewController:qvc animated:YES];
    
    
//    //  次の問題へ行くときに問題数を数える（１ずつ足していく）ために書いた。
    qvc.select_questionNo = self.select_questionNo+1;
    
    NSLog(@"%d" ,qvc.select_questionNo);
    
 
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

//  トップ画面へ戻るボタンが押されたらトップ画面へ戻る
- (IBAction)topbackBtn:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

//    ＊参考＊　３画面前に戻るコード
//    NSInteger count       = self.navigationController.viewControllers.count - 4;
//    ViewController *vc = [self.navigationController.viewControllers objectAtIndex:count];
//    [self.navigationController popToViewController:vc animated:YES];



    


@end
