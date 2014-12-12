//
//  CustomTableViewCell.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/12/12.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//


#import "ViewController.h"
#import "CustomTableViewCell.h"
//#import "TableViewConst.h"




@interface CustomTableViewCell ()

@end

@implementation CustomTableViewCell

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    // デリゲートメソッドをこのクラスで実装する
//    self.CustomTableViewCell.delegate = self;
//    self.CustomTableViewCell.dataSource = self;
//    
//    self.searchDisplayController.delegate = self;
//    
//    // テーブルに表示したいデータソースをセット
//    self.dataSourcecategory = @[@"Phrasal Verb", @"Synonym", @"Antonym", @"Two Meaning"];
//
//    
//    // カスタマイズしたセルをテーブルビューにセット
//    UINib *nib = [UINib nibWithNibName:TableViewCustomCellIdentifier bundle:nil];
//    [self.tableView registerNib:nib forCellReuseIdentifier:@"Cell"];
//    [self.searchDisplayController.searchResultsTableView registerNib:nib forCellReuseIdentifier:@"Cell"];
//}
//
//// ...省略
//
///**
// *  テーブルに表示するセルを返します。（実装必須）
// *
// *  @param tableView テーブルビュー
// *  @param indexPath セクション番号・行番号の組み合わせ
// *
// *  @return セル
// */
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    // ...省略
//}
//
//#pragma mark - UITableViewDelegate methods
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return [CustomTableViewCell rowHeight];
//}
//    
//    
//
    
    
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


+ (CGFloat)rowHeight
{
    return 75.0f;
}


@end
