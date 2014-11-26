//
//  note3ViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.



#import "note3ViewController.h"
#import "note2ViewController.h"
#import "answerViewController.h"

@interface note3ViewController ()

@end

@implementation note3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"単語帳(説明画面)note3ViewController";
    
    self.note3Label.text = [NSString stringWithFormat:@"%@", _note2Array[self.select_wordlist][@"question"]];
     NSLog(@"note3のNSLog▶︎%@",_note2Array[self.select_wordlist]);
    
//    これだと(null)になる。
    self.wordTextView.text = [NSString stringWithFormat:@"%@", _note2Array[self.select_wordlist][@"description"]];

    
    
//  for{
//    if(wordnoteから取り出したNo = PListで検索して取り出したNo)
//      プロパティリストからQuestionDataを取り出して表示に使用する　}
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)wordjumpBtn:(id)sender {
    if (_wordjumpBtn) {
        
        [self.wordjumpBtn setTitle:@"単語帳から削除する" forState:UIControlStateNormal];
        
    }else{
        
        [self.wordjumpBtn setTitle:@"単語帳に追加する" forState:UIControlStateNormal];
    }
    
   
}



- (IBAction)topbackBtn:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}


@end
