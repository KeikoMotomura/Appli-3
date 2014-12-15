//
//  noteViewController.h
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import <UIKit/UIKit.h>


static NSString * const TableViewCustomCellIdentifier3 = @"TableViewCustomCell3";

@interface noteViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>



{
    NSArray *_noteArray;
}


@property (strong, nonatomic) IBOutlet UITableView *noteTableView;

@property (weak, nonatomic) IBOutlet UIImageView *noteImageView;

@property(nonatomic,assign) int select_num;
@property(nonatomic,assign) int select_wordNo;

@end
