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
#import "AppDelegate.h"


@interface note2ViewController ()

@end


@implementation note2ViewController {NSString *boxname;} //メンバ変数

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
} //ViewDidRoadの終わり


-(void)viewWillAppear:(BOOL)animated{
    
    
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
    
    //単語種類を一番上に表示させる為のコード
    switch (self.select_wordNo) { //selectword categoryNoとして三個目のページに渡す
        case 0:
            self.title = @"Phrasal Verb";
            break;
            
        case 1:
            self.title = @"Synonym";
            break;
            
        case 2:
            self.title = @"Antonym";
            break;
            
        case 3:
            self.title = @"Two Meaning";
            break;
            
     
    }
    
    NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
    _note2Array = [myDefaults arrayForKey:@"wordnote"];
    
    
    
    
    
    
    //お気に入りリスト（最初はお気に入りでないものも全て保存）
    _noteArray = _note2Array.mutableCopy;//ここをsortに買えると一覧表示が全部消えるnote
    
    NSArray *checkArray = _note2Array.mutableCopy; //削除する対象の検索用にcheckArrayを用意
    
    //お気に入りとして指定されているか、チェック後、おきにいりのものだけを残し、他は削除する
    for (NSDictionary *note2Array_each in checkArray) {
        id questionNoid = note2Array_each[@"questionNo"];
        
        //取り出したデータ(queNoをint型に変換（if文で判定しやすいように)
        // 文字列をNSIntegerに変換
        NSInteger questionNo = [questionNoid intValue];
        NSLog(@"文字列→NSInteger：%@", questionNoid);
        
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
    
    //ソート対象となるキーを指定した、NSSortDescriptorの生成
    NSSortDescriptor *sortDescNumber;
    
    // NSSortDescriptorは配列に入れてNSArrayに渡す
    NSArray *sortDescArray; //ソートの材料をいれる
    
    NSArray *sortArray; //ソート後のもの
    
    sortDescNumber = [[NSSortDescriptor alloc] initWithKey:@"wordnote" ascending:YES];
    
    
    sortDescArray = [NSArray arrayWithObjects:sortDescNumber, nil];
    
    // ソートの実行
    sortArray = [_noteArray sortedArrayUsingDescriptors:sortDescArray];
    
   
    
    _noteArray = sortArray.mutableCopy;

    _note2TableView.delegate = self;
    _note2TableView.dataSource = self;
    
    
    
    //  画面が戻ったときに前回の選択状況を解除する
    [_note2TableView deselectRowAtIndexPath:_note2TableView.indexPathForSelectedRow animated:YES];
    


    
    
    }






//  単語をスワイプして一覧から削除 ＊スワイプ機能のみ＊
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    }



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _noteArray.count;//note ここだけsortにしても全部きえる
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifer = @"Cell";
    
    
    UITableViewCell *cell = [_note2TableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    
    cell.textLabel.text = _noteArray[indexPath.row][@"question"];//ここを変えたらダメ
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
    
    dvc.note2Array = _noteArray;//ここをsortに変えると一覧表示が全部消える
    
    dvc.select_wordNo = self.select_wordNo; //前の画面からもらった番号
    
    
    
    //   ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]
     pushViewController:dvc animated:YES];
    
    
    
    
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
