//
//  questionViewController.h
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface questionViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


{
    NSArray *_choiseArray;
    NSArray *_answerArray;
}


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *queLabel;
@property (weak, nonatomic) IBOutlet UITableView *choiseTableView;



@property(nonatomic,assign) int select_categoryNo;
@property(nonatomic,assign) int select_questionNo;


@end
