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

    _answerArray = @[@{@"name":@"apple",@"desc":@"apple2"},@{@"name":@"ant",@"desc":@"ant2文"},@{@"name":@"sisig",@"desc":@"sisig2"},@{@"name":@"sinigang",@"desc":@"sinigang2"}];
    
    NSLog(@"%lu", (unsigned long)_answerArray.count);
    
    _note2TableView.delegate = self;
    _note2TableView.dataSource = self;
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _note2Array.count;
    
}
    
-(UITableViewCell *)tableView:(UITableView *)tableViewcellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifer = @"Cell";
    

    UITableViewCell *cell = [_note2TableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    
    cell.textLabel.text = _note2Array[indexPath.row];
    return cell;
    
    
}
    
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)
    indexPath
    {
        NSLog(@"単語が選択されました");
        
        //  次画面を指定して遷移
        note3ViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"note3ViewController"];
        
        dvc.select_num = indexPath.row;
        
        dvc.select_wordlist = indexPath.row;
        dvc.note2Array = _note2Array;
        
        
        
        //   ナビゲーションコントローラーの機能で画面遷移
        [[self navigationController]
         pushViewController:dvc animated:YES];
        
    }
   
    


    
    
////  単語をスワイプできるようにした。
////  SwipeGestureのインスタンスを生成
//    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
////  スワイプの方向（右から左）
//    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
////   self.viewにジェスチャーをのせる
//    [self.view addGestureRecognizer:swipeLeftGesture];
//
////  単語をスワイプしたときに一覧から削除できるようにしたい　Deleteボタンの表示（ex:めもだもん）
//- (void)swipeLeft:(UISwipeGestureRecognizer *)sender
//{
//    NSLog(@"右から左にスワイプされました");
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
