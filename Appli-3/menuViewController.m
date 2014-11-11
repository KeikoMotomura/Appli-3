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
    
    self.titleLabel.text = @"種類を選択して下さい";
    
    
    
    self.title=@"問題種類を選択";
    
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
    
}

//何か行が押されたときにquestionViewControllerに画面推移する
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)
indexPath{
    
    
    questionViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"questionViewController"];
    
        dvc.select_num = indexPath.row;
    
    
    [[self navigationController]
     pushViewController:dvc animated:YES];
    
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
