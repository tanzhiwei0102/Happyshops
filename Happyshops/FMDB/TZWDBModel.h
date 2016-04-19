//
//  TZWDBModel.h
//  Happyshops
//
//  Created by TanZhiWei on 16/4/10.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TZWDBModel : NSObject
//创建数据库和表格
+(TZWDBModel *)shareDBModel;

//向表格插入数据
-(void)insertUserTable:(TUser *)UserModel;

//判断当前应用在表格中是否存在该成员
-(BOOL)isExistsUserWithUname:(NSString *)Uname;

//获取所有的登录用户
-(NSArray *)allloginUser:(NSString *)Uname;
@end
