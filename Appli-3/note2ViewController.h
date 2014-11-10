//
//  note2ViewController.h
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface note2ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


{
    NSArray *_note2Array;
}


@property (weak, nonatomic) IBOutlet UITableView *note2TableView;


@property(nonatomic,assign) int select_num;



@end
