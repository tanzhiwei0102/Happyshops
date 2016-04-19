//
//  TZWRequestModel.h
//  Happyshops
//
//  Created by TanZhiWei on 16/4/1.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol sendInfo <NSObject>
//一个视图控制器上请求数据的接口可以不止一个 为了区分请求的是哪个接口的数据 需要反馈一个接口信息
-(void)sendMessage:(NSData *)data andPath:(NSString *)path;
@end
@interface TZWRequestModel : NSObject
@property (nonatomic,retain) NSString * path;

@property (nonatomic,assign) id<sendInfo> delegate;

//触发数据请求的方法
-(void)startRequestInfo;
@end
