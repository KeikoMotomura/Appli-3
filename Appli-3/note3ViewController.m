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

    self.wordjumpLabel.text = @"OFFにすると単語帳から削除できます";
    

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)wordjumpSwitch:(id)sender{
    
//    スイッチがOFFになったら単語帳から外す、ONになったら再度単語帳に登録できるようにする。
    
    if(self.wordjumpSwitch.on){
        
        //単語帳に登録する
        NSLog(@"スイッチがONになりました");
        
    }else{
        
        //単語帳から削除する
        NSLog(@"スイッチがOFFになりました");
    }
    
}

- (IBAction)topbackBtn:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}
@end
