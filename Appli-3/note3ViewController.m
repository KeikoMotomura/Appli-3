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
    

//  この方法でquestionNoを取り出し▶︎それのdiscriptionを持ってくる表示に変更する
    
//    self.select_wordlist = self.select_wordlist;
//    NSLog(@"select_wordlistの数→%d",self.select_wordlist); //これで持って来てるのは何行目かということだけ（意味ないし、下も機能してない）
    
    //  bundle=プロジェクト内のファイルにアクセスできるオブジェクトを宣言(NSBundle型のオブジェクト）
    NSBundle *bundle = [NSBundle mainBundle];
    
    //  読み込むプロパティリストのファイルパス（場所）の指定
    NSString *path = [bundle pathForResource:@"QuizList"ofType:@"plist"];
    
    //  プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //  取得できた配列のデータをメンバ変数に代入(リストからデータを取ってきます▶︎これをPListに代入）
    NSDictionary *categoryTitle =
    @{@"0":@"PhrasalVerb",@"1":@"Synonym",@"2":@"Antonym",@"3":@"TwoMeaning"};
    NSLog(@"note3%@",[categoryTitle objectForKey:[NSString stringWithFormat:@"%d", self.select_categoryNo]]);
//    👆いつでもPhrasalVerbで出てくる
    
    _answerArray = [dic objectForKey:[categoryTitle objectForKey:@"0"]];
    
    for (NSDictionary *tmpQuestion in _answerArray) {
        if (_note2Array[self.select_wordlist][@"questionNo"] == tmpQuestion[@"questionNo"]) {
            self.wordTextView.text = tmpQuestion[@"description"];
            break;
        }

}

    self.wordTextView.text = [NSString stringWithFormat:@"%@", _noteArray[self.select_wordlist][@"description"]];
    
    self.wordTextView.editable = NO;
    
    
    
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


    
    
    
    
    
    
    



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)wordjumpBtn:(id)sender {
    
    
    
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
        
        [self.wordjumpBtn setTitle:@"単語帳から追加する" forState:UIControlStateNormal];
        
    }else{
        
        
        //    このボタンが押されたらユーザーデフォルトにqueNoとqueが保存される配列を作る
        
        
        
        //    保存したデータを取り出す　元々保存している単語をまず取り出す。
        NSArray *wordnote = [myDefaults arrayForKey:@"wordnote"];
        
        NSLog(@"wordnote=%@",wordnote); //questionとquestionNoを全部持って来ている（callinがいくつもある TODOひとつにしたい）
        
        //    wordnoteがnilだったら初期化する（これを書かないと０の掛け算状態でいつまでも単語を追加しても表示されないまま）
        if (wordnote == nil) {
            wordnote = [[NSArray alloc] init];
        }
        
        //   Arrayを書き換え可能な配列に書き換える
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

//    if (_noteArray[self.select_wordlist][@"questionNo"]) { //noteArrayに値があったら
//        
//        [self.wordjumpBtn setTitle:@"単語帳から削除する" forState:UIControlStateNormal];
//        
//    }else{
//        
//        [self.wordjumpBtn setTitle:@"単語帳に追加する" forState:UIControlStateNormal];
//    }
//    
   
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
