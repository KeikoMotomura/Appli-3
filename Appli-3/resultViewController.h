//
//  resultViewController.h
//  Appli-3
//
//  Created by 本村佳子 on 2014/11/11.
//  Copyright (c) 2014年 keikomotomura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface resultViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (weak, nonatomic) IBOutlet UIImageView *resultImage;

@property (weak, nonatomic) IBOutlet UIButton *topbackBtn;

- (IBAction)topbackBtn:(id)sender;

@end
