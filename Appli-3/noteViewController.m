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
    
    self.title=@"単語帳(目次)noteViewController";
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.02 green:0.96 blue:0.98 alpha:1.000];
    
  
    _noteArray = @[@"Phrasal Verb",@"Synonym",@"Antonym",@"Two Meaning"];
    
    _noteTableView.delegate = self;
    _noteTableView.dataSource = self;
    
    _noteTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
    
    
    
    
} //DidRoadの終わり

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

//     何か行が押されたときにnote2ViewControllerに画面推移する
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)
indexPath{
    
    NSLog(@"noteViewで選択したselect_wordNo▶︎%@", _noteArray[self.select_wordNo]);
//    👆いつでもPhrasalVerbで出てくる（note3のも同様？）
    
    
    
    note2ViewController *nvc = [self.storyboard instantiateViewControllerWithIdentifier:@"note2ViewController"];
    
    nvc.select_wordNo = indexPath.row;
    nvc.select_num = self.select_wordNo;

    
    [[self navigationController]
     pushViewController:nvc animated:YES];
    
}


//  画面を戻したときに前回選択した行の選択状況を解除する
- (void)viewWillAppear:(BOOL)animated{
    [_noteTableView deselectRowAtIndexPath:_noteTableView.indexPathForSelectedRow animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
