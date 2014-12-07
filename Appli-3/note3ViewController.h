//
//  note3ViewController.h
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.

#import <UIKit/UIKit.h>

@interface note3ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    NSMutableArray *_noteArray;
    NSMutableArray *_note2Array;
    NSMutableArray *_sortArray;

    NSArray *_answerArray;
    
    NSArray *_question;
    
    NSMutableArray *answerArray;
    
    BOOL _wordjumpflag;
}

@property (weak, nonatomic) IBOutlet UILabel *note3Label;
@property (weak, nonatomic) IBOutlet UITextView *wordTextView;

@property (weak, nonatomic) IBOutlet UIButton *nextpageBtn;
- (IBAction)nextpageBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *topbackBtn;
- (IBAction)topbackBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *wordjumpBtn;
- (IBAction)wordjumpBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *categorybackBtn;
- (IBAction)categorybackBtn:(id)sender;

@property(nonatomic,retain) NSArray *note2Array;

@property(nonatomic,assign) int select_num;
@property(nonatomic,assign) int select_wordNo;
@property(nonatomic,assign) int select_wordlist; //View2→View3にタップした単語を渡す為
@property(nonatomic,assign) int select_categoryNo;
@property(nonatomic,assign) int select_questionNo;


@end
