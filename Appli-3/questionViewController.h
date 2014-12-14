//
//  questionViewController.h
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const TableViewCustomCellIdentifier2 = @"TableViewCustomCell2";


@interface questionViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
    NSArray *_choiseArray;
//    NSArray *_answerArray; いらないかも。他に影響なかったら後で消す
    
    NSArray *_question;
    
}




@property (weak, nonatomic) IBOutlet UIImageView *explainImageView;

@property (weak, nonatomic) IBOutlet UILabel *queLabel;

@property (weak, nonatomic) IBOutlet UIImageView *queImageView;


@property (weak, nonatomic) IBOutlet UITableView *choiseTableView;



@property(nonatomic,assign) int select_categoryNo;
@property(nonatomic,assign) int select_questionNo;
@property(nonatomic,assign) int select_selectionNo;
@property(nonatomic,assign) int select_correctanswerNo;


@end
