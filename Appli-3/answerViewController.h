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
    NSArray *_answerArray;
    
    UIButton *_createnextButton;
}


@property (weak, nonatomic) IBOutlet UILabel *wordjumpLabel;
@property (weak, nonatomic) IBOutlet UISwitch *wordjumpSwitch;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;


@property(nonatomic,assign) int select_categoryNo;
@property(nonatomic,assign) int select_questionNo;


@property (weak, nonatomic) IBOutlet UIButton *menubackBtn;
@property (weak, nonatomic) IBOutlet UIButton *topbackBtn;


- (IBAction)wordjumpSwitch:(id)sender;

- (IBAction)menubackBtn:(id)sender;

- (IBAction)topbackBtn:(id)sender;

- (IBAction)nextBtn:(id)sender;


@end
