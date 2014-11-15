//
//  note3ViewController.m
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.



#import "note3ViewController.h"
#import "note2ViewController.h"

@interface note3ViewController ()

@end

@implementation note3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"単語帳(説明画面)note3ViewController";
    
    self.note3Label.text = [NSString stringWithFormat:@"%@",_note2Array[self.select_wordlist]];

    
    
    //UserDefaultからデータを取り出す
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *note2Array;
    
    //保存されたデータを取り出す
    note2Array = [defaults objectForKey:@"coffeeTable"];
    
    if (note2Array == nil) {
        //一度も保存されていない場合はデフォルトリストを代入する
        
}
    
    _note2Array = note2Array.mutableCopy;
    
    id favoriteflag = _note2Array[self.select_wordlist][@"favoriteflag"];
    
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0) {
        [self.wordjumpBtn setTitle:@"お気に入り追加" forState:UIControlStateNormal];
        
    }else{
        [self.wordjumpBtn setTitle:@"お気に入り解除" forState:UIControlStateNormal];
        
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)wordjumpBtn:(id)sender {
    
    NSDictionary *selectedWord = _note2Array[self.select_wordlist];
    
    NSMutableDictionary *changedWord = selectedWord.mutableCopy;
    
    id favoriteflag = _note2Array[self.select_wordlist][@"favoriteflag"];
    
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0) {
        [changedWord setObject:@1 forKey:@"favoriteflag"];
        
        //これからお気に入りに追加されるため、ボタン名を解除にセットしておく
        [self.wordjumpBtn setTitle:@"お気に入り解除" forState:UIControlStateNormal];
        
    }else{
        [changedWord setObject:@0 forKey:@"favoriteflag"];
        
        //これからお気に入り解除されるため、ボタン名を追加にセットしておく
        [self.wordjumpBtn setTitle:@"お気に入り追加" forState:UIControlStateNormal];
        
}
    
//    [_note2Array replaceObjectAtIndex:self.select_wordlist withObject:changedWord];
    
    //UserDefaultObjectを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //文字を保存
    [defaults setObject:_note2Array forKey:@"WordListTable"];
    [defaults synchronize];
}



- (IBAction)topbackBtn:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}
@end
