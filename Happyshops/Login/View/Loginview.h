//
//  Loginview.h
//  Happyshops
//
//  Created by TanZhiWei on 16/4/2.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Loginview : UIView

@property (nonatomic,strong)UILabel *userLabel;
@property (nonatomic,strong)UILabel *pwdLabel;

@property (nonatomic,strong)UITextField *userTextField;
@property (nonatomic,strong)UITextField *pwdTextField;

@property (nonatomic,strong)UIButton *signBtn;
@property (nonatomic,strong)UIButton *loginBtn;
@end
