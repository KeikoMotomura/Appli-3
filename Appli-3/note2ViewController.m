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
   

    _note2Array = @[@"（仮）",@"ここに",@"単語リストを",@"表示させたい"];
    
    _note2TableView.delegate = self;
    _note2TableView.dataSource = self;
    
    _note2TableView.separatorColor = [UIColor redColor]; //色は後で変更
    

//      単語をスワイプできるようにした。
    [super viewDidLoad];
    //SwipeGestureのインスタンスを生成
    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    //スワイプの方向（右から左）
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    //self.viewにジェスチャーをのせる
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
    
    // 次画面を指定して遷移
    note3ViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"note3ViewController"];
    
//    dvc.select_num = indexPath.row;
    
    
    //    ナビゲーションコントローラーの機能で画面遷移
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
