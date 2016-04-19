//
//  TZWRequestModel.m
//  Happyshops
//
//  Created by TanZhiWei on 16/4/1.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import "TZWRequestModel.h"
#import <AFHTTPSessionManager.h>
#import <MMProgressHUD.h>
@implementation TZWRequestModel
-(void)startRequestInfo
{
    //<1>创建请求操作管理者对象
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    //<2>关闭自动解析方法
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 添加 自己的key值
    [manager.requestSerializer setValue:@"e75e9d0ff9d7ac7d59d8b07f1d35e693" forHTTPHeaderField:@"apikey"];
    //添加一个动态加载控件
    //1、设置样式
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleDrop];
    //2、设置标题
    [MMProgressHUD showDeterminateProgressWithTitle:nil status:@"正在加载😄"];
    
    //<3>开始请求数据（请求的数据是NSData类型）由于不确定解析以后的数据是使用数组存放还是字典存放 所以将解析功能关闭
    [manager GET:self.path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //<4>将请求的数据反馈给视图控制器
        if([self.delegate respondsToSelector:@selector(sendMessage:andPath:)])
        {
            [self.delegate sendMessage:responseObject andPath:self.path];
        }
        else
        {
            NSLog(@"被动方没有实现协议中的方法");
        }
        [MMProgressHUD dismissWithSuccess:@"加载完成✨"];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"%@",error.description);
    }];

}

@end
