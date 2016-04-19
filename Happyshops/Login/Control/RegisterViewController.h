//
//  RegisterViewController.h
//  Happyshops
//
//  Created by TanZhiWei on 16/4/2.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^UserInfo)(NSDictionary *dic);
@interface RegisterViewController : UIViewController
@property(nonatomic,copy)UserInfo userinfo;
@end
