//
//  noteViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import "noteViewController.h"
#import "note2ViewController.h"

@interface noteViewController ()

@end

@implementation noteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Words Note";
  
    _noteArray = @[@"Phrasal Verb",@"Synonym",@"Antonym",@"Two Meaning"];
    
    _noteTableView.delegate = self;
    _noteTableView.dataSource = self;
    
    _noteTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _noteArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    
    static NSString *CellIdentifier = @"Cell";
    
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = _noteArray[indexPath.row];
    return cell;
    
}

//何か行が押されたときにnote2ViewControllerに画面推移する
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)
indexPath{
    
    
    note2ViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"note2ViewController"];
    
//    dvc.select_num = indexPath.row;
    
    
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
