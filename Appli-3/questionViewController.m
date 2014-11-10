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
    
    self.titleLabel.text = @"問題種類を表示するためのラベル";
    self.queLabel.text = _choiseArray[self.select_num];
    
    
    
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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)
indexPath
{
    NSLog(@"選択肢がタップされました");
    
       
    // 次画面を指定して遷移
    answerViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"answerViewController"];
    
//    ナビゲーションコントローラーの機能で画面遷移
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
