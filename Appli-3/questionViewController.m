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
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    

    
    NSDictionary *categoryTitle =
    @{@"0":@"PhrasalVerb",@"1":@"Synonym",@"2":@"Antonym",@"3":@"TwoMeaning"};
    
    NSLog(@"%@",[categoryTitle objectForKey:[NSString stringWithFormat:@"%d", self.select_categoryNo]]);
    
    
    
    
    
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
    
    NSString *categoryName;
    
    categoryName = [categoryTitle objectForKey:[NSString stringWithFormat:@"%d", self.select_categoryNo]];
    

    //  取得できた配列のデータをメンバ変数に代入(リストのPrefectureListからデータを取ってきます▶︎これをPListに代入）
    _question = [dic objectForKey:categoryName];
    
    //    問題の表示
    self.queLabel.text =
    [NSString stringWithFormat:@"%@", _question[self.select_questionNo][@"question"]];
//＊＊＊ここまで＊＊＊
    
    _choiseArray = @[ _question[self.select_questionNo][@"selection0"],_question[self.select_questionNo][@"selection1"],_question[self.select_questionNo][@"selection2"],_question[self.select_questionNo][@"selection3"]];
    
    
    
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
    answerViewController *answervc = [self.storyboard instantiateViewControllerWithIdentifier:@"answerViewController"];

//  移動した先のセレクトナムというプロパティに値がわたる
    answervc.select_categoryNo = self.select_categoryNo;
    answervc.select_questionNo = indexPath.row;
    answervc.select_selectionNo = indexPath.row;//選択肢の番号をanswerViewに渡す

    
//  正解数を次の画面に渡す
    answervc.select_correctanswerNo = self.select_correctanswerNo;
    NSLog(@"正解数▶︎%d",self.select_correctanswerNo);

    
//  次の問題へ行くときに問題数を数える（１ずつ足していく）ために書いた
    answervc.select_questionNo = self.select_questionNo;
    
//  ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]
     pushViewController:answervc animated:YES];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    
}


@end
