//
//  questionViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.

//＊＊やりたいこと＊＊　すべてひとつの画面で四種類使い回す
//labelに問題種類を表示させる
//ちょっと大きめの枠に単語を表示する
//４つ選択肢をつくる▶︎ひとつが正解画面に飛ぶ、残り３つは不正解画面に飛ぶ

//titleLabel=問題の種類を表示するためのラベル、queLabel=問題の単語を表示する用のラベル,,,

#import "questionViewController.h"
#import "answerViewController.h"

@interface questionViewController ()

@end

@implementation questionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"questionViewController";
    

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
    
//    問題の表示（②画面を４種類で使い回す）
    self.queLabel.text = @"問題の単語を表示";
    
    _choiseArray = @[@"（仮）",@"ここに",@"選択肢を",@"表示させたい"];
    
    
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

@end
