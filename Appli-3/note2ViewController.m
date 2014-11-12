//
//  note2ViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import "note2ViewController.h"
#import "note3ViewController.h"


@interface note2ViewController ()

@end

@implementation note2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"単語帳(単語リスト)note2ViewController";
    
    nvc.select_wordNo = self.select_wordNo;
//    self.notetitleLabel.text = _noteArray[self.select_wordNo];
    
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

    _note2Array = @[@"ant",@"apple",@"cookie",@"strawberry"];
    
    _note2TableView.delegate = self;
    _note2TableView.dataSource = self;
    
    _note2TableView.separatorColor = [UIColor redColor]; //色は後で変更
    
    

//  単語をスワイプできるようにした。
    [super viewDidLoad];
//  SwipeGestureのインスタンスを生成
    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
//  スワイプの方向（右から左）
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
//   self.viewにジェスチャーをのせる
    [self.view addGestureRecognizer:swipeLeftGesture];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _note2Array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
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
    
//    dvc.select_num = indexPath.row;
    
    
//   ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController]
     pushViewController:dvc animated:YES];
    
}

//  単語をスワイプしたときに一覧から削除できるようにしたい　Deleteボタンの表示（ex:めもだもん）
- (void)swipeLeft:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"右から左にスワイプされました");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
