//
//  note3ViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.



#import "note3ViewController.h"
#import "note2ViewController.h"
#import "answerViewController.h"

@interface note3ViewController ()

@end

@implementation note3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title=@"単語帳(説明画面)note3ViewController";
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
    
    self.note3Label.text = [NSString stringWithFormat:@"%@", _note2Array[self.select_wordlist][@"question"]];
    NSLog(@"選択した単語のNo▶︎%@",_note2Array[self.select_wordlist][@"questionNo"]);
    
    self.select_categoryNo = self.select_wordNo;//前画面からわたって来たwordNoをcategoryNoに代入する
    
    
    //  bundle=プロジェクト内のファイルにアクセスできるオブジェクトを宣言(NSBundle型のオブジェクト）
    NSBundle *bundle = [NSBundle mainBundle];
    
    //  読み込むプロパティリストのファイルパス（場所）の指定
    NSString *path = [bundle pathForResource:@"QuizList"ofType:@"plist"];
    
    //  プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSString *key;
    

    switch (self.select_categoryNo) {
            
        
        case 0:
            key = @"PhrasalVerb";
            break;
            
        case 1:
            key = @"Synonym";
            break;
            
        case 2:
            key = @"Antonym";
            break;
            
        case 3:
            key = @"TwoMeaning";
            break;
            
            
            
    }

    
    
    
    //  取得できた配列のデータをメンバ変数に代入(リストのPrefectureListからデータを取ってきます▶︎これをPListに代入）
    _answerArray = [dic objectForKey:key];
    //  currentNoに前画面からわたって来た「選択した単語のquestionNo」 を代入（型を整数型にするため）
    int currentNo = [_note2Array[self.select_wordlist][@"questionNo"] intValue];

    //　For文で_answerArrayの中身を探してひとつづつtmpQuestionに入れていく
    for (NSDictionary *tmpQuestion in _answerArray) {//answerArrayから一個づつ取り出します▶︎とりだしたひとつがtmpquestionに入る
        NSLog(@"%@",tmpQuestion);
    // 　checkNoに👆で探したtmpQuestionの中のquestionNoだけを持って来て代入する（型を整数型にするため）
        int checkNo = [tmpQuestion[@"questionNo"] intValue];
    //　　currentNoとcheckNoがイコールだったら　＝　前画面からもらったqueNoと_answerArrayのqueNoがイコールだったら        
        if (currentNo == checkNo)
        {
            self.wordTextView.text = tmpQuestion[@"description"];

            break;
        }

    }
    
    
    self.wordTextView.editable = NO;
    
    
    
//    ここから下は単語帳登録・削除ボタンの指示
    //    最初はFlagをYESにしておく
        _wordjumpflag = YES;
    
        [self.wordjumpBtn setTitle:@"単語帳から削除する" forState:UIControlStateNormal];
    //wordjumpflag用意　単語帳登録されている＝YES
    //if(_wordjumpflag){ //==YESの意味になる
    

    
    //    単語帳を検索する
    NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
    _note2Array = [myDefaults arrayForKey:@"wordnote"];
    
    //    お気に入りとして指定されているか、チェック後、おきにいりのものだけを残し、他は削除する
    for (NSDictionary *note2Array_each in _note2Array) {
        id questionNoid = note2Array_each[@"questionNo"];
        
        //     単語帳に登録されていたら（見つかったら）フラグをYESに変更する
        //        （PListのquestionNoとquestionNoidが一致したら）
        if ([_answerArray[self.select_questionNo][@"questionNo"] intValue] != [questionNoid intValue]) {
            _wordjumpflag = NO;
            
            break;//単語帳から見つかったら検索を中止するのでここでbreak
            
             [self.wordjumpBtn setTitle:@"単語帳から削除する" forState:UIControlStateNormal];
        }
    }
    
    
    

}//DidRoadの終わり





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)wordjumpBtn:(id)sender {
    
    NSLog(@"note3単語帳登録ボタンが押されました");
    
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
        
        //    wordnoteがnilだったら初期化する（これを書かないと０の掛け算状態でいつまでも単語を追加しても表示されないまま）
        if (wordnote == nil) {
            wordnote = [[NSArray alloc] init];
        }
        
        //   Arrayを書き換え可能な配列に書き換える(編集可能な状態にする為にこの１行が必要）
        NSMutableArray *changedword = wordnote.mutableCopy;
        
        NSDictionary *savedquestion = @{@"questionNo":_answerArray[self.select_questionNo][@"questionNo"],
                                        @"question":_answerArray[self.select_questionNo][@"question"]};
        
        //  リストを追加
        [changedword addObject:savedquestion];
        
        //  ひとつリストを追加したあとにリスト全部を表示
        [myDefaults setObject:changedword forKey:@"wordnote"];
        
        //   設定してすぐ保存したいときのメソッド(最後に書く)
        [myDefaults synchronize];
        
        
        _wordjumpflag = YES;
        
        
        [self.wordjumpBtn setTitle:@"単語帳から削除する" forState:UIControlStateNormal];
        
        
        
    }
    
    
    
}

- (IBAction)nextpageBtn:(id)sender {
    NSLog(@"次の単語へボタンが押されました");
    
    note3ViewController *notevc = [self.storyboard instantiateViewControllerWithIdentifier:@"note3ViewController"];
    
    [[self navigationController] pushViewController:notevc animated:YES];
    


}



- (IBAction)topbackBtn:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}


@end
