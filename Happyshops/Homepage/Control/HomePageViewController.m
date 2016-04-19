//
//  HomePageViewController.m
//  Happyshops
//
//  Created by TanZhiWei on 16/4/1.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import "HomePageViewController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
@interface HomePageViewController ()<sendInfo>

@end

@implementation HomePageViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"首页";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   // [self requstdata];
    //    if (self.rdv_tabBarController.tabBar.translucent) {
    //        UIEdgeInsets insets = UIEdgeInsetsMake(0,
    //                                               0,
    //                                               CGRectGetHeight(self.rdv_tabBarController.tabBar.frame),
    //                                               0);
    //        self.tableView.contentInset = insets;
    //        self.tableView.scrollIndicatorInsets = insets;
    //    }
    // [[self rdv_tabBarItem] setBadgeValue:[NSString stringWithFormat:@"%ld", indexPath.row+1]];
}
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//
//    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
//
//    [super viewWillDisappear:animated];
//}
-(void)requstdata{
    TZWRequestModel *model = [[TZWRequestModel alloc]init];
    NSString *HosUrl =@"http://apis.baidu.com/baidunuomi/openapi/shopinfo?shop_id=1745896";
    model.path = HosUrl;
    model.delegate = self;
    [model startRequestInfo];
}
-(void)sendMessage:(NSData *)data andPath:(NSString *)path{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@",dic);
  //  [_dataSource addObjectsFromArray:array];
  //  [_tableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
