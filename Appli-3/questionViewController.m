//
//  questionViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.



#import "questionViewController.h"
#import "answerViewController.h"

@interface questionViewController ()

@end

@implementation questionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"questionViewController";
    
//    ここに文字列の変数をひとつ用意
    NSDictionary *wordTitle =
                @{@"0":@"Phrasal verb",@"1":@"Synonym",@"2":@"Antonym",@"3":@"Two Meaning"};
    
    NSLog(@"%@",[wordTitle objectForKey:@"4"]);
    
    
    
    
//  一番上に問題種類を表示する為のSwitch構文
    switch (self.select_categoryNo) {
                    case 0:
                    self.titleLabel.text = @"Phrasal Verb";
                    break;
            
                    case 1:
                    self.titleLabel.text = @"Synonym";
                    break;
            
                    case 2:
                    self.titleLabel.text = @"Antonym";
                    break;
            
                    case 3:
                    self.titleLabel.text = @"Two Meaning";
                    break;

}
    
    
//＊＊＊＊問題の単語をプロパティリストから表示させる為のコード＊＊＊
    //  bundle=プロジェクト内のファイルにアクセスできるオブジェクトを宣言(NSBundle型のオブジェクト）
    NSBundle *bundle = [NSBundle mainBundle];
    
    //  読み込むプロパティリストのファイルパス（場所）の指定
    NSString *path = [bundle pathForResource:@"QuizList"ofType:@"plist"];
    
    //  プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //  取得できた配列のデータをメンバ変数に代入(リストのPrefectureListからデータを取ってきます▶︎これをPListに代入）
//    _question = [dic objectForKey:[self.select_categoryNo]]; ※ここがわからない
     _question = [dic objectForKey:@"PhrasalVerb"];
    
    //    問題の表示
    self.queLabel.text =
    [NSString stringWithFormat:@"%@", _question[self.select_categoryNo][@"question"]];
//＊＊＊ここまで＊＊＊
    
    _choiseArray = @[ _question[self.select_wordlist][@"selection1"],_question[self.select_wordlist][@"selection2"],_question[self.select_wordlist][@"selection3"],_question[self.select_wordlist][@"selection4"]];
    
    
    
    _choiseTableView.delegate = self;
    _choiseTableView.dataSource = self;
    
    _choiseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _choiseArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = _choiseArray[indexPath.row];
    return cell;
    

}

//  画面を戻したときに前回選択した行の選択状況を解除する
- (void)viewWillAppear:(BOOL)animated{
    [_choiseTableView deselectRowAtIndexPath:_choiseTableView.indexPathForSelectedRow animated:YES];
    
}


//  選択肢をタップしたら画面遷移
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)
indexPath
{
    NSLog(@"選択肢がタップされました");
    
     
           
//  次画面を指定して遷移
    answerViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"answerViewController"];

//  移動した先のセレクトナムというプロパティに値がわたる
    dvc.select_categoryNo = self.select_categoryNo;
    
//  次の問題へ行くときに問題数を数える（１ずつ足していく）ために書いた
    dvc.select_questionNo = self.select_questionNo;
    
//  ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]
     pushViewController:dvc animated:YES];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    
}


@end
