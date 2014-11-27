//
//  note2ViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//
//  answerViewControllerで登録ボタンが押されたらここのTableViewに単語を表示させる。
//  answerViewでボタンをしたときにquestionNoとquestionが入っている配列をユーザーデフォルトに保存
//  ▶︎それを呼び出して、単語だけを表示させる。

#import "note2ViewController.h"
#import "note3ViewController.h"
#import "answerViewController.h"


@interface note2ViewController ()

@end

@implementation note2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"単語帳(単語リスト)note2ViewController";
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];  // バーアイテムカラー
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
    
    //単語種類を一番上に表示させる為のコード
    switch (self.select_wordNo) {
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

    
    

//＊＊＊この配列いらない？
//    _answerArray = @[@{@"name":@"apple",@"desc":@"apple2"},@{@"name":@"ant",@"desc":@"ant2文"},@{@"name":@"sisig",@"desc":@"sisig2"},@{@"name":@"sinigang",@"desc":@"sinigang2"}];
//    NSLog(@"note2_answerArrayの値▶︎%lu", (unsigned long)_answerArray.count);
    
    _note2TableView.delegate = self;
    _note2TableView.dataSource = self;
    
    
    
    
    
    //お気に入りリスト（最初はお気に入りでないものも全て保存）
    _noteArray = answerArray.mutableCopy;
    
    //お気に入りとして指定されているか、チェック後、おきにいりのものだけを残し、他は削除する
    for (NSDictionary *note2Array_each in _noteArray) {
        id favoriteflag = note2Array_each[@"question"];
        
        //取り出したデータ(queNoをint型に変換（if文で判定しやすいように)
        // 文字列をNSIntegerに変換
        NSString *str= _note2Array[self.select_wordlist];
        NSInteger questionNo = str.integerValue;
        NSLog(@"文字列→NSInteger：%ld", questionNo);
        
        
//        if (intFavFlag == 0) {
//            //お気に入り指定されてないので削除
//            [_noteArray removeObject:note2Array_each];
//            
//        }
//    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
//  単語をスワイプできるようにした。
    // SwipeGestureのインスタンスを生成
    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:
                                                  self action:@selector(swipeLeft:)];
    //  スワイプの方向（右から左）
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    //   self.viewにジェスチャーをのせる
    [self.view addGestureRecognizer:swipeLeftGesture];
    
    
} //ViewDidRoadの終わり


//  単語をスワイプしたときに一覧から削除できるようにしたい　Deleteボタンの表示（ex:めもだもん）
    - (void)swipeLeft:(UISwipeGestureRecognizer *)sender
    {
        NSLog(@"右から左にスワイプされました");
    }
    

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _note2Array.count;
    
}
    
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifer = @"Cell";
    

    UITableViewCell *cell = [_note2TableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    
    cell.textLabel.text = _note2Array[indexPath.row][@"question"];
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
        
        dvc.select_wordlist = indexPath.row;　//選んだ単語を次の画面へ渡す
        
        dvc.note2Array = _note2Array;
        
        
        //   ナビゲーションコントローラーの機能で画面遷移
        [[self navigationController]
         pushViewController:dvc animated:YES];
        
            
}

//  画面を戻したときに前回選択した行の選択状況を解除する
- (void)viewWillAppear:(BOOL)animated{
    [_note2TableView deselectRowAtIndexPath:_note2TableView.indexPathForSelectedRow animated:YES];

    
}
    






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
