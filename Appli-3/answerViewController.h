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
    UIButton *_note2Array;
    
    
    NSArray *_choiseArray;
    NSArray *_answerArray;
    NSArray *_wordnoteArray;
    NSArray *_question;
    
    
    NSMutableArray *answerArray;

    
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


- (IBAction)menubackBtn:(id)sender;

- (IBAction)topbackBtn:(id)sender;

- (IBAction)nextBtn:(id)sender;

- (IBAction)wordjumpBtn:(id)sender;

@end
