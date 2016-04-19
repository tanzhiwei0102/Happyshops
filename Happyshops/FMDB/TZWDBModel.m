//
//  TZWDBModel.m
//  Happyshops
//
//  Created by TanZhiWei on 16/4/10.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import "TZWDBModel.h"
#import <FMDatabase.h>
#import "TUser.h"
@implementation TZWDBModel
{
    FMDatabase * fmdb;
}
+(TZWDBModel *)shareDBModel
{
    static TZWDBModel * dbModel = nil;
    if(dbModel == nil)
    {
        dbModel = [[TZWDBModel alloc]init];
    }
    return dbModel;
}
-(id)init
{
    self = [super init];
    if(self)
    {
        //<1>创建数据库
        NSString * path = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/HappyshopDB.db"];
        //<2>
        fmdb = [[FMDatabase alloc]initWithPath:path];
        BOOL isOpen = [fmdb open];
        if(isOpen)
        {
            //<3>创建表格
            NSString * sql = @"create table if not exists UserTable (Uname varchar(256),Upwd varchar(256),UEmail varchar(256))";
            BOOL isSuccess = [fmdb executeUpdate:sql];
            if(isSuccess)
            {
                NSLog(@"表格创建成功");
            }
            else
            {
                NSLog(@"表格创建失败");
            }
        }
        
        else
        {
            NSLog(@"数据库打开失败%@",fmdb.lastErrorMessage);
        }
    }
    return self;
}
-(void)insertUserTable:(TUser *)UserModel
{
    NSString * sql = @"insert into UserTable (Uname,Upwd,UEmail) values (?,?,?)";
    BOOL isSuccess = [fmdb executeUpdate:sql,UserModel.Uname,UserModel.Upwd,UserModel.UEmail];
    if(isSuccess)
    {
        NSLog(@"数据插入成功");
    }
    else
    {
        NSLog(@"数据插入失败%@",fmdb.lastErrorMessage);
    }
}
-(BOOL)isExistsUserWithUname:(NSString *)Uname
{
    NSString * sql = @"select * from UserTable where Uname = ? ";
    FMResultSet * result = [fmdb executeQuery:sql,Uname];
    if([result next])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
-(NSArray *)allloginUser:(NSString *)Uname
{
    NSString * sql = @"select * from UserTable where Uname = ?";
    FMResultSet * result = [fmdb executeQuery:sql,Uname];
    
    NSMutableArray * appArr = [[NSMutableArray alloc]init];
    while([result next])
    {
        TUser * UserModel = [[TUser alloc]init];
        UserModel.UEmail = [result stringForColumn:@"UEmail"];
        UserModel.Uname = [result stringForColumn:@"Uname"];
        UserModel.Upwd = [result stringForColumn:@"Upwd"];
        
        [appArr addObject:UserModel];
    }
    
    return appArr;
}

@end
