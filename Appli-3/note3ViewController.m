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
    
    self.note3Label.text = [NSString stringWithFormat:@"%@",_note2Array[self.select_wordlist]];

    
    
    //UserDefaultからデータを取り出す
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *wordTmp;
    
    //保存されたデータを取り出す
    wordTmp = [defaults objectForKey:@"coffeeTable"]; //coffeeTableは何をさしているのか？
    
    if (wordTmp == nil) {
        //一度も保存されていない場合はデフォルトリストを代入する
        
}
    
    wordTmp = @[@{@"name":@"apple",@"desc":@"apple2",@"favoriteflag":@"0"},@{@"name":@"ant",@"desc":@"ant2文",@"favoriteflag":@"0"},@{@"name":@"sisig",@"desc":@"sisig2",@"favoriteflag":@"0"},@{@"name":@"sinigang",@"desc":@"sinigang2",@"favoriteflag":@"0"}];
    
    _answerArray = wordTmp.mutableCopy;
    
    _answerArray[self.select_num][@"name"];
    
    self.wordTextView.text = _answerArray[self.select_num][@"desc"];
    
    id favoriteFlag = _answerArray[self.select_num][@"favoriteflag"];
    
    int intFavFlag = [favoriteFlag intValue];
    
    if(intFavFlag == 0){
        
        [self.wordjumpBtn setTitle:@"単語帳登録" forState:UIControlStateNormal];
        
    }else{
        
        [self.wordjumpBtn setTitle:@"単語帳削除" forState:UIControlStateNormal];

    }
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)wordjumpBtn:(id)sender {
    
    NSDictionary *selectedWord = _answerArray[self.select_num];
    
    NSMutableDictionary *changedWord = selectedWord.mutableCopy;
    
    id favoriteflag = _answerArray[self.select_num][@"favoriteflag"];
    
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0) {
        [changedWord setObject:@1 forKey:@"favoriteflag"];
        
        //これからお気に入りに追加されるため、ボタン名を解除にセットしておく
        [self.wordjumpBtn setTitle:@"単語帳削除" forState:UIControlStateNormal];
        
    }else{
        [changedWord setObject:@0 forKey:@"favoriteflag"];
        
        //これからお気に入り解除されるため、ボタン名を追加にセットしておく
        [self.wordjumpBtn setTitle:@"単語帳登録" forState:UIControlStateNormal];
        
}
   
//    ？？わからない（エラーになる）
//    [_answerArray replaceObjectAtIndex:self.select_wordlist withObject:changedWord];
   
    
    //UserDefaultObjectを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //文字を保存
    [defaults setObject:_answerArray forKey:@"coffeeTable"];
    [defaults synchronize];
}



- (IBAction)topbackBtn:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}


@end
