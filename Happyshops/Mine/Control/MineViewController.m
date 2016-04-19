//
//  MineViewController.m
//  Happyshops
//
//  Created by TanZhiWei on 16/4/15.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import "MineViewController.h"
#import "MineCell.h"
#import "MineshareCell.h"
#import "MinetopCell.h"
@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *table;
@property(nonatomic,strong)NSArray *imageArr;
@property(nonatomic,strong)NSArray *titleArr;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人中心";
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:.23 green:0.53 blue:0.76 alpha:1.00]];
    self.navigationController.navigationBar.translucent =NO;
    self.navigationController.automaticallyAdjustsScrollViewInsets =NO;
    
    
    [self createValue];
    [self createUI];
    [self.table reloadData];
}
-(void)createValue{
    _imageArr = @[@"MyLogin",@"collection",@"comments",@"share",@"Myaccount",@"order",@"wallet",@"setting",@"help"];
    _titleArr = @[@"请点击登陆",@"我的收藏",@"我的评论",@"我的分享",@"我的帐号",@"我的订单",@"我的钱包",@"系统设置",@"帮助与反馈"];
}
-(void)createUI{
    CGRect rect = self.view.frame;
    rect.size.height -= 64;
    self.table = [[UITableView alloc]initWithFrame:rect style:UITableViewStyleGrouped];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.showsVerticalScrollIndicator =NO;
    [self.view addSubview:self.table];
}
#pragma mark tabledelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 3;
    }
    else{
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        MinetopCell *celll = [tableView dequeueReusableCellWithIdentifier:@"MinetopCell"];
        if (!celll) {
            celll = [[[NSBundle mainBundle]loadNibNamed:@"MinetopCell" owner:self options:0]lastObject];
        }
        celll.Leftimageview.image = [UIImage imageNamed:_imageArr[indexPath.section]];
        if (_name ==nil) {
            celll.titleLable.text = _titleArr[indexPath.section];
        }else{
            celll.titleLable.text = @"123";
        }
        
        return celll;
    }
    else if(indexPath.section ==1){
        MineshareCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineshareCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MineshareCell" owner:self options:0] lastObject];
        }
        [cell.collButten addTarget:self action:@selector(collClick) forControlEvents:UIControlEventTouchUpInside];
        cell.collTitleLable.text = _titleArr[indexPath.section];
        [cell.commButten addTarget:self action:@selector(commClick) forControlEvents:UIControlEventTouchUpInside];
        cell.commtitleLable.text = _titleArr[indexPath.section+1];
        [cell.shareButten addTarget:self action:@selector(shareClick) forControlEvents:UIControlEventTouchUpInside];
        cell.sharetitle.text = _titleArr[indexPath.section+2];
        return cell;
    }else{
        MineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineCell"];
        if (!cell) {
            cell =[[[NSBundle mainBundle]loadNibNamed:@"MineCell" owner:self options:0] lastObject];
        }
        if (indexPath.section ==2) {
            
            cell.titleimageview.image = [UIImage imageNamed:_imageArr[indexPath.row+4]];
            cell.titleLable.text = _titleArr[indexPath.row+4];
        }else if(indexPath.section ==3){
            
            cell.titleimageview.image = [UIImage imageNamed:_imageArr[indexPath.row+7]];
            cell.titleLable.text = _titleArr[indexPath.row+7];
        }
        else{
            cell.titleimageview.image = [UIImage imageNamed:_imageArr[indexPath.row+8]];
            cell.titleLable.text = _titleArr[indexPath.row+8];
        }
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        return 1;
    }
    else{
        return 5;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        return 110;
    }else if(indexPath.section ==1){
        return 85;
    }else{
        
        return 65;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        LoginViewController *log = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:log animated:YES];
        self.rdv_tabBarController.tabBarHidden = YES;
    }
    else if(indexPath.section ==1)
    {
        
    }
    else if(indexPath.section ==2){
        
    }else if(indexPath.section ==3){
        
    }else{
       
    }
}
-(void)collClick{

}
-(void)shareClick{

}
-(void)commClick{
  
}
-(void)viewWillAppear:(BOOL)animated{
    self.rdv_tabBarController.tabBarHidden = NO;
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
