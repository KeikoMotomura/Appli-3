//
//  note3ViewController.h
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/06.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface note3ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UILabel *note3Label;
@property (weak, nonatomic) IBOutlet UITextView *wordTextView;


@property (weak, nonatomic) IBOutlet UILabel *wordjumpLabel;

@property (weak, nonatomic) IBOutlet UISwitch *wordjumpSwitch;
- (IBAction)wordjumpSwitch:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *nextpageBtn;


@property(nonatomic,assign) int select_num;



@end
