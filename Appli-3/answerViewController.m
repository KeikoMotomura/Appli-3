//
//  answerViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.


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
    

    
    //  bundle=プロジェクト内のファイルにアクセスできるオブジェクトを宣言(NSBundle型のオブジェクト）
    NSBundle *bundle = [NSBundle mainBundle];
    
    //  読み込むプロパティリストのファイルパス（場所）の指定
    NSString *path = [bundle pathForResource:@"QuizList"ofType:@"plist"];
    
    //  プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSString *categoryName;
    
    NSDictionary *categoryTitle =
    @{@"0":@"PhrasalVerb",@"1":@"Synonym",@"2":@"Antonym",@"3":@"TwoMeaning"};
    
    NSLog(@"%@",[categoryTitle objectForKey:[NSString stringWithFormat:@"%d", self.select_categoryNo]]);
    
    categoryName = [categoryTitle objectForKey:[NSString stringWithFormat:@"%d", self.select_categoryNo]];
    
    
    
    
    //  取得できた配列のデータをメンバ変数に代入(リストのPrefectureListからデータを取ってきます▶︎これをPListに代入）
    _answerArray = [dic objectForKey:categoryName];
    
    self.answerTextView.text = [NSString stringWithFormat:@"%@%@",_answerArray[self.select_questionNo][@"question"],_answerArray[self.select_questionNo][@"description"]];
    

    
//TODO正解なら○の画像、不正解なら×の画像を出す▶︎正解keyとそれ以外
    self.select_selectionNo = self.select_selectionNo; //前のページでタップされた値を持ってくる

    NSLog(@"select_selectionNoの数→%d",self.select_selectionNo);
    
    NSLog(@"PListのanswer番号→%@",_answerArray[self.select_questionNo][@"answer"]);
    
    //    この２つはあってもなくても変わらないので、たぶんいらない。
    //    NSString *answerKey;
    //    answerKey = [categoryTitle objectForKey:[NSString stringWithFormat:@"%d", self.select_categoryNo]];
    
    if ( self.select_selectionNo == [_answerArray[self.select_questionNo][@"answer"] intValue])
    {   self.answerImageView.image = [UIImage imageNamed:@"maru.png"];
        self.select_correctanswerNo +=1;
        
    } else {
        self.answerImageView.image = [UIImage imageNamed:@"batu.png"];
        
    }
    
//正解数に応じて結果画面のメッセージと画像を変えるため
    self.select_correctanswerNo = self.select_correctanswerNo;
    NSLog(@"正解数▶︎%d",self.select_correctanswerNo);
   
    
    
    [self _createnextButton];
    
    
    
    //UserDefaultからデータを取り出す
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *coffeeTmp;
    
    //保存されたデータを取り出す
    coffeeTmp = [defaults objectForKey:@"coffeeTable"];
    
    if (coffeeTmp == nil) {
        //一度も保存されていない場合はデフォルトリストを代入する
        
        //配列を使った場合
        coffeeTmp = _answerArray;
        
    }
    
    _note2Array = coffeeTmp.mutableCopy;
    
    
    id favoriteflag = _answerArray[self.select_questionNo][@"favoriteflag"];
    
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0) {
        [self.wordjumpBtn setTitle:@"単語帳追加" forState:UIControlStateNormal];
        
    }else{
        [self.wordjumpBtn setTitle:@"単語帳削除" forState:UIControlStateNormal];
        
    }
    
}

    





-(void)viewWillAppear:(BOOL)animated{
}



-(void) _createnextButton{
    
    //  ボタンの位置を決定
    _nextButton = [[UIButton alloc] initWithFrame:CGRectMake (200, 550, 100, 10)];
    
    //  ボタンに表示する文字を指定
    [_nextButton setTitle:@"次の問題へ" forState:UIControlStateNormal];
    
    if (self.select_questionNo == 2) {
        NSLog(@"問題カウント数３になりました");
        
    //  ボタンに表示する文字を指定
        [_nextButton setTitle:@"結果を見る" forState:UIControlStateNormal];
        
}
    

    //  ボタンの色を指定
    [_nextButton setTitleColor:[UIColor blueColor]forState:UIControlStateNormal];
    
    //  ボタンを表示している
    [self.view addSubview: _nextButton];
    
    [_nextButton addTarget:self action:@selector(tapButton)
          forControlEvents:UIControlEventTouchUpInside];
    
   
    
    
}


    //   ボタンをタップしたときに反応
-(void)tapButton{

    //  「次の問題へ」ボタンが押されたら次のquestion画面が開く
    NSLog(@"次の問題へボタンが押されました");
    
    
    questionViewController *qvc = [self.storyboard instantiateViewControllerWithIdentifier:@"questionViewController"];
    
//        次の問題へ行くときに問題数を数える（１ずつ足していく）ために書いた。
    qvc.select_questionNo = self.select_questionNo+1;
    
    NSLog(@"select_questionNoの値→%d" ,qvc.select_questionNo);
    
    qvc.select_correctanswerNo = self.select_correctanswerNo;
    
    
    if (self.select_questionNo == 2) {
        
        // 次画面を指定して遷移
        resultViewController *kvc = [self.storyboard instantiateViewControllerWithIdentifier:@"resultViewController"];
        
        // resultViewControllerの画面に正解数を渡す
        kvc.select_correctanswerNo  = self.select_correctanswerNo;
        
        //  ナビゲーションコントローラーの機能で画面遷移
        [[self navigationController]
         pushViewController:kvc animated:YES];
    
        
 
    }else{
        //  次画面を指定して遷移
        
        //  questionViewからわたってきたself.select numをここに代入＝ここを入れることで値が前の選択したものを覚えている
        //  Synonymなら１だな。Twomeaningなら３だな。
        qvc.select_categoryNo = self.select_categoryNo;
        
        //  ナビゲーションコントローラーの機能で画面遷移
        [[self navigationController]
         pushViewController:qvc animated:YES];

    }
}


- (IBAction)wordjumpBtn:(id)sender {
    
    NSLog(@"単語帳登録ボタンが押されました");

    NSDictionary *selectedWord = _answerArray[self.select_questionNo];
    
    NSMutableDictionary *changedWord = selectedWord.mutableCopy;
    
    id favoriteflag = _answerArray[self.select_questionNo][@"favoriteflag"];
    
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0) {
        [changedWord setObject:@1 forKey:@"favoriteflag"];
        
        //これからお気に入りに追加されるため、ボタン名を解除にセットしておく
        [self.wordjumpBtn setTitle:@"単語帳削除" forState:UIControlStateNormal];
        
    }else{
        [changedWord setObject:@0 forKey:@"favoriteflag"];
        
        //これからお気に入り解除されるため、ボタン名を追加にセットしておく
        [self.wordjumpBtn setTitle:@"単語帳追加" forState:UIControlStateNormal];
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
        


//問題種類へ戻るボタンが押されたら反応
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
