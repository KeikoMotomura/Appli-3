//
//  answerViewController.h
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface answerViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    
    UIButton *_nextButton;
    NSArray *_note2Array;
    
    
    NSArray *_choiseArray;
    NSArray *_answerArray;
    NSArray *_wordnoteArray;
    NSArray *_question;
    
    
    NSMutableArray *answerArray;
    BOOL _wordjumpflag; //BOOL Integer型はアスタリスク着かない。ポインタ変数じゃないやつ

    NSMutableArray *_noteArray;
    
    
    
    NSDateFormatter *df;   //日にちの表示の書式を設定
    NSDate *today;         //今日の日付を呼び出す
    NSString *datestr;     //書式の設定

    
}



@property (weak, nonatomic) IBOutlet UIImageView *answerImageView;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;


@property(nonatomic,assign) int select_categoryNo;
@property(nonatomic,assign) int select_questionNo;
@property(nonatomic,assign) int select_selectionNo;
@property(nonatomic,assign) int select_correctanswerNo;


@property (weak, nonatomic) IBOutlet UIButton *menubackBtn;
@property (weak, nonatomic) IBOutlet UIButton *topbackBtn;
@property (weak, nonatomic) IBOutlet UIButton *wordjumpBtn;

@property (weak, nonatomic) IBOutlet UIImageView *kokuban;

- (IBAction)menubackBtn:(id)sender;

- (IBAction)topbackBtn:(id)sender;

- (IBAction)nextBtn:(id)sender;

- (IBAction)wordjumpBtn:(id)sender;

@end
