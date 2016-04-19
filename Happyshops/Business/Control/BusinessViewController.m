//
//  BusinessViewController.m
//  Happyshops
//
//  Created by TanZhiWei on 16/4/1.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import "BusinessViewController.h"
#import "ShopCell.h"
@interface BusinessViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,strong)NSArray *imagesource;
@end

@implementation BusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人中心";
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:.23 green:0.53 blue:0.76 alpha:1.00]];
    self.navigationController.navigationBar.translucent =NO;
    _dataSource = [[NSArray alloc]init];
    _imagesource = [[NSArray alloc]init];
    [self createUI];

}
-(void)createUI{
    
    
    
    // 下面的tableview
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, WIDTH, HEIGHT-154) style:UITableViewStylePlain];
    _tableview.tableFooterView = [[UITableView alloc]init];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    _dataSource = @[@"我的账号",@"我的订单",@"我的钱包",@"系统设置",@"关于我们"];
    _imagesource = @[@"MyAccount.png",@"Order.png",@"Money.png",@"Setting.png",@"AboutUs.png"];
}
#pragma mark tableviewdelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ShopCell" owner:self options:0] lastObject];
    }
   // cell.TLable.text = _dataSource[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
