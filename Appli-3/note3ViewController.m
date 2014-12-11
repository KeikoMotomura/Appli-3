//
//  note3ViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.


#import "noteViewController.h"
#import "note3ViewController.h"
#import "note2ViewController.h"
#import "answerViewController.h"

@interface note3ViewController ()

@end

@implementation note3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Detail";
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
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
    
    
    //    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //
    //    _answerArray = app.shufflequestion10;
    //
    
    
    
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
    for (NSDictionary *tmpQuestion in _answerArray) {
        //answerArrayから一個づつ取り出します▶︎とりだしたひとつがtmpquestionに入る
        NSLog(@"%@",tmpQuestion);
        // 　checkNoに👆で探したtmpQuestionの中のquestionNoだけを持って来て代入する（型を整数型にするため）
        int checkNo = [tmpQuestion[@"questionNo"] intValue];
        //　　currentNoとcheckNoがイコールだったら　＝　前画面からもらったqueNoと_answerArrayのqueNoがイコールだったら
        if (currentNo == checkNo)
        {
            self.wordTextView.text = [NSString stringWithFormat:@"%@\n\n\n\n%@\n\n%@", tmpQuestion[@"description1"],tmpQuestion[@"description2"],tmpQuestion[@"description3"]];
            break;
        }
    }
    
    self.wordTextView.editable = NO;
    
    
    
    //＊＊＊ここから下は単語帳登録・削除ボタンの指示＊＊＊
    //    最初はFlagをYESにしておく(ボタンの初期表示を「削除」にするため）
    _wordjumpflag = YES;
    
    [self.wordjumpBtn setTitle:@"単語帳から削除する" forState:UIControlStateNormal];
    
    
    //    単語帳を検索する
    NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *tmp = [myDefaults arrayForKey:@"wordnote"];//単語帳のデータを取り出して
    //ソート（ichinohe 追加）
    //ソート対象となるキーを指定した、NSSortDescriptorの生成
    NSSortDescriptor *sortDescNumber;
    
    // NSSortDescriptorは配列に入れてNSArrayに渡す
    NSArray *sortDescArray; //ソートの材料をいれる
    
    NSArray *sortArray; //ソート後のもの
    
    sortDescNumber = [[NSSortDescriptor alloc] initWithKey:@"wordnote" ascending:YES];
    
    
    sortDescArray = [NSArray arrayWithObjects:sortDescNumber, nil];
    
    // ソートの実行
    sortArray = [tmp sortedArrayUsingDescriptors:sortDescArray];
    
    
    
    _note2Array = sortArray.mutableCopy;//編集可能な形で代入
    
    //    お気に入りとして指定されているか、チェック後、おきにいりのものだけを残し、他は削除する
    for (NSDictionary *note2Array_each in _note2Array) {//note2
        id questionNoid = note2Array_each[@"questionNo"];
        
        //     単語帳に登録されていなかったらフラグをNOに変更する
        //    （PListのquestionNoとquestionNoidが一致したら）
        if ([_answerArray[self.select_questionNo][@"questionNo"] intValue] != [questionNoid intValue]) {
            _wordjumpflag = NO;
            
            [self.wordjumpBtn setTitle:@"単語帳から削除する" forState:UIControlStateNormal];
            
            break;//単語帳から見つかったら検索を中止するのでここでbreak
            
            
        }}
    
    //    if (単語帳の一覧で最後のページだったら) {
    //        self.nextpageBtn.hidden = YES;　ボタンを非表示にする
    //    }
    
    
    _noteArray = _sortArray.mutableCopy;
    
    
}//ViewWillAppearの終わり







- (IBAction)wordjumpBtn:(id)sender {//単語帳から削除ボタンを押したら
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"＊単語帳から削除＊" message:@"Delete？" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    
    [alert show];
    
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    //アラートビューの削除でYESが押されたらインデックスに画面遷移
    
    if (buttonIndex == 1) {
        
        NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
        
        int currentNo = [_note2Array[self.select_questionNo][@"questionNo"] intValue];
        
        NSMutableArray *checkArray = _note2Array.mutableCopy;//note2
        
        for (NSDictionary *note2Array_each in checkArray) {
            id questionNoid = note2Array_each[@"questionNo"];
            
            NSInteger questionNo = [questionNoid intValue];
            
            if (currentNo == questionNo) {
                [_note2Array removeObject:note2Array_each];//note
                
                
                [myDefaults setObject:_note2Array forKey:@"wordnote"];///////note2
                
                //  設定してすぐ保存したいときのメソッド(最後に書く)
                [myDefaults synchronize];
                
                break;
                
                
                
            }
        }
        
        _wordjumpflag = NO;
        
        
        
        NSInteger count = self.navigationController.viewControllers.count - 2;
        note3ViewController *vc = [self.navigationController.viewControllers
                                   objectAtIndex:count];
        [self.navigationController popToViewController:vc animated:YES];
        
        
    }
    
    
}





- (IBAction)nextpageBtn:(id)sender {//次のページへは移動する。次の行のデータを持ってくるようにしたい。
    NSLog(@"次の単語へボタンが押されました");
    
    note3ViewController *notevc = [self.storyboard instantiateViewControllerWithIdentifier:@"note3ViewController"];
    
    [[self navigationController] pushViewController:notevc animated:YES];
    
    //  bundle=プロジェクト内のファイルにアクセスできるオブジェクトを宣言(NSBundle型のオブジェクト）
    NSBundle *bundle = [NSBundle mainBundle];
    
    //  読み込むプロパティリストのファイルパス（場所）の指定
    NSString *path = [bundle pathForResource:@"QuizList"ofType:@"plist"];
    
    //  プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //    次ページの単語を表示させる為に追加してみた（必要かは不明）
    self.select_wordlist = self.select_wordlist+1;
    NSLog(@"note3のwoldlistNO▶︎%d", _select_wordlist);
    
    
    
    
}








- (IBAction)topbackBtn:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)categorybackBtn:(id)sender {
    
    // 次画面を指定して遷移
    noteViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"noteViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]
     pushViewController:dvc animated:YES];
    
    
}


@end
