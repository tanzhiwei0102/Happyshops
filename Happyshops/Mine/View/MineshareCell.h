//
//  MineshareCell.h
//  Happyshops
//
//  Created by TanZhiWei on 16/4/15.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineshareCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *collButten;
@property (weak, nonatomic) IBOutlet UILabel *collTitleLable;
@property (weak, nonatomic) IBOutlet UIView *Spreline;

@property (weak, nonatomic) IBOutlet UIButton *commButten;

@property (weak, nonatomic) IBOutlet UILabel *commtitleLable;
@property (weak, nonatomic) IBOutlet UIView *rigitspreLine;
@property (weak, nonatomic) IBOutlet UIButton *shareButten;
@property (weak, nonatomic) IBOutlet UILabel *sharetitle;
@end
