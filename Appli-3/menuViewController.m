//
//  menuViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/05.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import "menuViewController.h"
#import "questionViewController.h"

@interface menuViewController ()

@end

@implementation menuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"問題種類を選択 menuViewController";
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
    
    
    
    
    self.titleLabel.text = @"種類を選択して下さい";
    
    
    _menuArray = @[@"Phrasal Verb",@"Synonym",@"Antonym",@"Two Meaning"];
    
    
    
    
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
