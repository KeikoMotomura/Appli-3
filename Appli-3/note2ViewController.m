//
//  note2ViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import "note2ViewController.h"
#import "note3ViewController.h"
#import "answerViewController.h"


@interface note2ViewController ()

@end

@implementation note2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
} //ViewDidRoadの終わり


-(void)viewWillAppear:(BOOL)animated{
    
    
    self.title=@"単語帳(単語リスト)note2ViewController";
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
    
    //単語種類を一番上に表示させる為のコード
    switch (self.select_wordNo) { //selectword categoryNoとしてcategoryNoとして三個目のページに渡す
        case 0:
            self.notetitleLabel.text = @"Phrasal Verb";
            break;
            
        case 1:
            self.notetitleLabel.text = @"Synonym";
            break;
            
        case 2:
            self.notetitleLabel.text = @"Antonym";
            break;
            
        case 3:
            self.notetitleLabel.text = @"Two Meaning";
            break;
            
            
            
    }
    
    NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
    _note2Array = [myDefaults arrayForKey:@"wordnote"];
    
    _note2TableView.delegate = self;
    _note2TableView.dataSource = self;
    
    
    
    
    
    //お気に入りリスト（最初はお気に入りでないものも全て保存）
    _noteArray = _note2Array.mutableCopy;
    
    NSArray *checkArray = _note2Array.mutableCopy; //削除する対象の検索用にcheckArrayを用意
    
    //お気に入りとして指定されているか、チェック後、おきにいりのものだけを残し、他は削除する
    for (NSDictionary *note2Array_each in checkArray) {
        id questionNoid = note2Array_each[@"questionNo"];
        
        //取り出したデータ(queNoをint型に変換（if文で判定しやすいように)
        // 文字列をNSIntegerに変換
        NSInteger questionNo = [questionNoid intValue];
        NSLog(@"文字列→NSInteger：%ld", questionNo);
        
        switch (self.select_wordNo) {
            case 0:
                if (questionNo>=2000) {
                    
                    [_noteArray removeObject:note2Array_each];
                }
                
                break;
                
            case 1:
                if ((questionNo<2001) || (questionNo>3000)) {
                    
                    [_noteArray removeObject:note2Array_each];
                }
                break;
                
            case 2:
                if ((questionNo<3001) || (questionNo>4000)) {
                    
                    [_noteArray removeObject:note2Array_each];
                    
                    break;
                    
                case 3:
                    if (questionNo<4001) {
                        
                        [_noteArray removeObject:note2Array_each];
                    }
                    break;
                    
                }
                
        }}
    
    
    
    
    
}




//  単語をスワイプして一覧から削除 **現状：ひとつ削除したら全ての単語が一緒に消える
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    _wordjumpflag = YES;
    //
    //    if (editingStyle == UITableViewCellEditingStyleDelete){
    //
    //        NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
    //
    //        _noteArray = _note2Array.mutableCopy;
    //
    //        NSArray *checkArray = _note2Array.mutableCopy; //削除する対象の検索用にcheckArrayを用意
    //
    //        //お気に入りとして指定されているか、チェック後、おきにいりのものだけを残し、他は削除する
    //        for (NSDictionary *note2Array_each in checkArray) {
    //            id questionNoid = note2Array_each[@"questionNo"];
    //
    //            //取り出したデータ(queNoをint型に変換（if文で判定しやすいように)
    //            // 文字列をNSIntegerに変換
    //            NSInteger questionNo = [questionNoid intValue];
    //
    //            if ([_answerArray[self.select_questionNo][@"questionNo"] intValue] != [questionNoid intValue]) {
    //
    //            [_noteArray removeObject:note2Array_each];
    //
    //            NSDictionary *delDec =_noteArray[indexPath.row];
    //                [_noteArray removeObject:delDec];
    //
    //                break;
    //            }
    //
    //
    //
    //        [myDefaults setObject:_noteArray forKey:@"wordnote"];
    //
    //        //   設定してすぐ保存したいときのメソッド(最後に書く)
    //        [myDefaults synchronize];
    //
    //        _wordjumpflag = NO;
    //
    //
    //        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    //
    //
    //}}
    
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _noteArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifer = @"Cell";
    
    
    UITableViewCell *cell = [_note2TableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    
    cell.textLabel.text = _noteArray[indexPath.row][@"question"];
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)
indexPath
{
    NSLog(@"単語が選択されました");
    NSLog(@"wordlistの数字%d", self.select_wordlist);
    
    //  次画面を指定して遷移
    note3ViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"note3ViewController"];
    
    dvc.select_num = indexPath.row;
    
    dvc.select_wordlist = indexPath.row;//選んだ単語を次の画面へ渡す（押した場所）
    
    dvc.note2Array = _noteArray;
    
    dvc.select_wordNo = self.select_wordNo; //前の画面からもらった番号
    
    
    //   ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]
     pushViewController:dvc animated:YES];
    
    
    
    
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
