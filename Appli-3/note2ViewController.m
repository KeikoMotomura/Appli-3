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
    
    self.title=@"単語帳(単語リスト)note2ViewController";
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
    
    //単語種類を一番上に表示させる為のコード
    switch (self.select_wordNo) {
        case 0:
            //1001~2000
            self.notetitleLabel.text = @"Phrasal Verb";
            break;
            
        case 1:
//            2001~3000
            self.notetitleLabel.text = @"Synonym";
            break;
            
        case 2:
//            3001~4000
            self.notetitleLabel.text = @"Antonym";
            break;
            
        case 3:
//            4001~5000
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
    
    NSArray *checkArray = answerArray.mutableCopy; //削除する対象の検索用にcheckArrayを用意
    
    //お気に入りとして指定されているか、チェック後、おきにいりのものだけを残し、他は削除する
    for (NSDictionary *note2Array_each in checkArray) {
        id questionNoid = note2Array_each[@"questionNo"];
        
        //取り出したデータ(queNoをint型に変換（if文で判定しやすいように)
        // 文字列をNSIntegerに変換
        NSInteger questionNo = [questionNoid intValue];
        NSLog(@"文字列→NSInteger：%ld", questionNo);
        
        switch (self.select_wordNo) {
            case 0:
                if (questionNo==1001) { //==1001でもcallinは削除されなかった
                
                    [_noteArray removeObject:note2Array_each];
                }

                break;
                
            case 1:
                if ((questionNo>2000) && (questionNo>3000)) {
                    
                    [_noteArray removeObject:note2Array_each];
                }
                break;
                
            case 2:
                if ((questionNo>3000) && (questionNo>4000)) {
                    
                    [_noteArray removeObject:note2Array_each];
            
                break;
                
            case 3:
                if ((questionNo>4000) && (questionNo>5000)) {
                    
                    [_noteArray removeObject:note2Array_each];
                }
               break;
                
                }

        
 

        }}
    
//    オブジェクトを末尾に追加するコード
//    - (void)addObject:(id)anObject{
//        NSMutableArray *note2Array = [[NSMutableArray alloc] init];
//        NSString *str = [[NSString alloc] initWithString:@"文字列"];
//        [note2Array addObject:str];
//        [str release];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
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
