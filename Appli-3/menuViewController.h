//
//  menuViewController.h
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/05.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const TableViewCustomCellIdentifier = @"TableViewCustomCell";

@interface menuViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


{
    
    NSArray *_menuArray;
}



@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UITableView *menuTableView;


@property (weak, nonatomic) IBOutlet UITextView *categoryExplainText;


@end
