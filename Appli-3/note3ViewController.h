//
//  note3ViewController.h
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface note3ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    
    NSArray *_noteArray;
    NSArray *_note2Array;
    NSArray *_answerArray;
    
    NSMutableArray *answerArray;
    
}



@property (weak, nonatomic) IBOutlet UILabel *note3Label;
@property (weak, nonatomic) IBOutlet UITextView *wordTextView;


- (IBAction)topbackBtn:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *nextpageBtn;

@property (weak, nonatomic) IBOutlet UIButton *topbackBtn;

@property(nonatomic,assign) int select_num;
@property(nonatomic,assign) int select_wordNo;
@property(nonatomic,assign) int select_wordlist; //View2→View3にタップした単語を渡す為に書いてみた
@property(nonatomic,retain) NSArray *note2Array;

@property (weak, nonatomic) IBOutlet UIButton *wordjumpBtn;
- (IBAction)wordjumpBtn:(id)sender;


@end
