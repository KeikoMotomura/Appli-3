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
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];  // バーアイテムカラー
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
    
    self.note3Label.text = [NSString stringWithFormat:@"%@", _note2Array[self.select_wordlist][@"question"]];
    NSLog(@"note3のNSLog▶︎%@",_note2Array[self.select_wordlist][@"questionNo"]);
    

//  この方法でquestionNoを取り出し▶︎それのdiscriptionを持ってくる表示に変更する
    
    self.select_wordlist = self.select_wordlist;
    NSLog(@"select_wordlistの数→%d",self.select_wordlist); //これで持って来てるのは何行目かということだけ（意味ないし、下も機能してない）
    
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


    
    
    self.wordTextView.editable = NO;
    
    
    
//  for{
//    if(wordnoteから取り出したNo = PListで検索して取り出したNo)
//      プロパティリストからQuestionDataを取り出して表示に使用する　}
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)wordjumpBtn:(id)sender {
    if (_wordjumpBtn) {
        
        [self.wordjumpBtn setTitle:@"単語帳から削除する" forState:UIControlStateNormal];
        
    }else{
        
        [self.wordjumpBtn setTitle:@"単語帳に追加する" forState:UIControlStateNormal];
    }
    
   
}



- (IBAction)topbackBtn:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}


@end
