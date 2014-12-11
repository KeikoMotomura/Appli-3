//
//  menuViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/05.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import "menuViewController.h"
#import "questionViewController.h"
#import "AppDelegate.h"//グローバル変数を使う為に必要

@interface menuViewController ()

@end

@implementation menuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title=@"問題種類を選択 menuViewController";
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
    
    
    
    
    self.titleLabel.text = @"種類を選択して下さい";
    
    
    _menuArray = @[@"Phrasal Verb",@"Synonym",@"Antonym",@"Two Meaning"];
    
    self.categoryExplainText.text = @"Phrasal Verb・・フレーズ動詞\nSynonym・・・同意語\nAntonym・・・反意語\nTwo Meaning・・複数の意味を持つ単語";
    
    
    
    
    _menuTableView.delegate = self;
    _menuTableView.dataSource = self;
    
    _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}




//  画面を戻したときに前回選択した行の選択状況を解除する
- (void)viewWillAppear:(BOOL)animated
{
    [_menuTableView deselectRowAtIndexPath:_menuTableView.indexPathForSelectedRow animated:YES];
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _menuArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = _menuArray[indexPath.row];
    return cell;
    
    //    cell.contentView.backgroundColor = [UIColor redColor]; 背景色を変更したかったがうまく行かなかった。
    
}



//何か行が押されたときにquestionViewControllerに画面推移する
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)
indexPath{
    
    
    
    questionViewController *questionvc = [self.storyboard instantiateViewControllerWithIdentifier
                                          :@"questionViewController"];
    
    
    questionvc.select_categoryNo = indexPath.row;
    
    
    //    ここにシャッフルを描く
    NSDictionary *categoryTitle =
    @{@"0":@"PhrasalVerb",@"1":@"Synonym",@"2":@"Antonym",@"3":@"TwoMeaning"};
    
    NSLog(@"questionで選んだcategory▶︎%@",[categoryTitle objectForKey:[NSString stringWithFormat:@"%d", questionvc.select_categoryNo]]);
    
    NSString *select_title;
    
    //  一番上に問題種類を表示する為のSwitch構文
    switch (questionvc.select_categoryNo) {
        case 0:
            select_title = @"Phrasal Verb";
            break;
            
        case 1:
            select_title = @"Synonym";
            break;
            
        case 2:
            select_title = @"Antonym";
            break;
            
        case 3:
            select_title = @"Two Meaning";
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
    
    categoryName = [categoryTitle objectForKey:[NSString stringWithFormat:@"%d", questionvc.select_categoryNo]];
    
    
    // AppDelegate Object作成（インスタンス化(オブジェクトを作成すること)）
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    app.shufflequestion10 = [[dic objectForKey:categoryName] mutableCopy];
    
    
    
    
    
    for (int i=0; i<[app.shufflequestion10 count]; i++)//0~69にひとつづつ増えて行く
    {
        int j = arc4random() % ([app.shufflequestion10 count]-1);//j=    arc4random
        [app.shufflequestion10 exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    
    
    
    
    
    [[self navigationController]
     pushViewController:questionvc animated:YES];
    
    
    
    //    もしかして使っていないかもしれないので、他に影響がなさそうだったら後で消す。
    //    NSDictionary *wordTitle =
    //    @{@"0":@"Phrasal verb",@"1":@"Synonym",@"2":@"Antonym",@"3":@"Two Meaning"};
    //
    //    //    NSLog(@"%@",[wordTitle objectForKey:@"3"]);
    //
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




@end
