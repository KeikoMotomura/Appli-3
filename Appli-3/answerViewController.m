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
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
    
    
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
    
    self.answerTextView.text = [NSString stringWithFormat:@"%@\n%@",_answerArray[self.select_questionNo][@"question"],_answerArray[self.select_questionNo][@"description"]];
    
    
    self.answerTextView.editable = NO;
    
    
    //TODO正解なら○の画像、不正解なら×の画像を出す▶︎正解keyとそれ以外
    self.select_selectionNo = self.select_selectionNo; //前のページでタップされた値を持ってくる
    
    NSLog(@"select_selectionNoの数→%d",self.select_selectionNo);
    NSLog(@"PListのanswer番号→%@",_answerArray[self.select_questionNo][@"answer"]);
    
    if ( self.select_selectionNo == [_answerArray[self.select_questionNo][@"answer"] intValue])
        
    {   self.answerImageView.image = [UIImage imageNamed:@"maru.png"];
        self.select_correctanswerNo +=1; //+=1 で１プラスの意味になる
        
    } else {
        self.answerImageView.image = [UIImage imageNamed:@"batu.png"];
        
    }
    
    //正解数に応じて結果画面のメッセージと画像を変えるため
    self.select_correctanswerNo = self.select_correctanswerNo;
    NSLog(@"正解数▶︎%d",self.select_correctanswerNo);
    
    
    
    [self _createnextButton];
    
    //    ここから下は単語帳登録・削除ボタンの指示
    //    最初はFlagをNOにしておく
    _wordjumpflag = NO;
    
    //    単語帳を検索する
    NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
    _note2Array = [myDefaults arrayForKey:@"wordnote"];
    
    //    お気に入りとして指定されているか、チェック後、おきにいりのものだけを残し、他は削除する
    for (NSDictionary *note2Array_each in _note2Array) {
        id questionNoid = note2Array_each[@"questionNo"];
        
        //     単語帳に登録されていたら（見つかったら）フラグをYESに変更する
        //        （PListのquestionNoとquestionNoidが一致したら）
        if ([_answerArray[self.select_questionNo][@"questionNo"] intValue] == [questionNoid intValue]) {
            _wordjumpflag = YES;
            
            break;//単語帳から見つかったら検索を中止するのでここでbreak
        }
    }
    
    
    
    //    wordjumpflag用意　単語帳登録していたらYESとかにして条件を付ける
    
    if(_wordjumpflag){ //==YESの意味になる
        
        [self.wordjumpBtn setTitle:@"単語帳から削除する" forState:UIControlStateNormal];
    }else{
        [self.wordjumpBtn setTitle:@"単語帳に追加する" forState:UIControlStateNormal];
        
        
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


//   「次の問題へ」ボタンが押されたら次のquestion画面が開く
-(void)tapButton{
    
    questionViewController *qvc = [self.storyboard instantiateViewControllerWithIdentifier:@"questionViewController"];
    
    // 次の問題へ行くときに問題数を数える（１ずつ足していく）ために書いた。
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
    
    NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults]; //宣言（ここに入れるとif else両方で使える）
    
    if (_wordjumpflag == YES) {
        
        _noteArray = _note2Array.mutableCopy;
        
        NSArray *checkArray = _note2Array.mutableCopy; //削除する対象の検索用にcheckArrayを用意
        
        //お気に入りとして指定されているか、チェック後、おきにいりのものだけを残し、他は削除する
        for (NSDictionary *note2Array_each in checkArray) {
            id questionNoid = note2Array_each[@"questionNo"];
            
            //取り出したデータ(queNoをint型に変換（if文で判定しやすいように)
            // 文字列をNSIntegerに変換
            NSInteger questionNo = [questionNoid intValue];
            
            if ([_answerArray[self.select_questionNo][@"questionNo"] intValue] == [questionNoid intValue]) {
                [_noteArray removeObject:note2Array_each];
                
                break;
            }
            
            
            
        }
        
        [myDefaults setObject:_noteArray forKey:@"wordnote"];
        
        //   設定してすぐ保存したいときのメソッド(最後に書く)
        [myDefaults synchronize];
        
        
        _wordjumpflag = NO;
        
        [self.wordjumpBtn setTitle:@"単語帳へ追加する" forState:UIControlStateNormal];
        
    }else{
        
        //    保存したデータを取り出す　元々保存している単語をまず取り出す。
        NSArray *wordnote = [myDefaults arrayForKey:@"wordnote"];
        
        NSLog(@"wordnote=%@",wordnote);
        
        //    wordnoteがnilだったら初期化する（これを書かないと０の掛け算状態でいつまでも単語を追加しても表示されないまま）
        if (wordnote == nil) {
            wordnote = [[NSArray alloc] init];
        }
        
        //   Arrayを書き換え可能な配列に書き換える
        NSMutableArray *changedword = wordnote.mutableCopy;
        
        // 保存した日付をとる
        today = [NSDate date];
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat = @"yyyy/MM/dd HH:mm:ss";
        
        // 時刻、日付を書式の通りに変換する
        datestr = [df stringFromDate:today];
        
        NSLog(@"datestrの中身▶︎%@",datestr);
        
        NSDictionary *savedquestion = @{@"questionNo":_answerArray[self.select_questionNo][@"questionNo"],
                                        @"question":_answerArray[self.select_questionNo][@"question"],
                                        @"created":datestr};
    
        // リストを追加
        [changedword addObject:savedquestion];
        
        // ひとつリストを追加したあとにリスト全部を表示
        [myDefaults setObject:changedword forKey:@"wordnote"];
        
        // 設定してすぐ保存したいときのメソッド(最後に書く)
        [myDefaults synchronize];
        
        
        _wordjumpflag = YES;
        
        
        [self.wordjumpBtn setTitle:@"単語帳から削除する" forState:UIControlStateNormal];
        
        
  
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



//問題種類へ戻るボタンが押されたら反応
- (IBAction)menubackBtn:(id)sender {
    
    
    // 次画面を指定して遷移
    menuViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"menuViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
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
