//
//  note2ViewController.h
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const TableViewCustomCellIdentifier = @"TableViewCustomCell";


@interface note2ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


{
    
    NSArray *_answerArray;

    NSMutableArray *_noteArray;
    NSMutableArray *_note2Array;
    NSMutableArray *answerArray;
    NSMutableArray *_sortArray;
    
    BOOL _wordjumpflag;
}



@property (weak, nonatomic) IBOutlet UITableView *note2TableView;


@property(nonatomic,assign) int select_num;
@property(nonatomic,assign) int select_questionNo;
@property(nonatomic,assign) int select_wordNo; //Viewから選択した分類を渡す為に書いてある。
@property(nonatomic,assign) int select_wordlist; //View3にタップした単語を渡す為に書いてみた


@end
