//
//  LoginViewController.m
//  Happyshops
//
//  Created by TanZhiWei on 16/4/2.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import "LoginViewController.h"
#import "Loginview.h"
#import "ResetPwdViewController.h"
#import "MainViewController.h"
@interface LoginViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
@property(nonatomic,strong)Loginview *Loginview;
@property(nonatomic,retain)NSString *almessage;
@end

@implementation LoginViewController
-(void)loadView{
    self.Loginview = [[Loginview alloc]init];
    self.view = _Loginview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.Loginview setBackgroundColor:[UIColor whiteColor]];
    self.Loginview.userTextField.delegate = self;
    self.Loginview.pwdTextField.delegate = self;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFromColor:[UIColor flatBlueColor]] forBarMetrics:UIBarMetricsCompact];
    self.navigationController.navigationBar.tintColor = [UIColor flatBlueColor];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init]
                                      forBarPosition:UIBarPositionAny
                                          barMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    [self p_Action];
}
-(void)p_Action{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(leftAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"忘记密码" style:UIBarButtonItemStyleDone target:self action:@selector(rightAction:)];
    
    [self.Loginview.loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];   //  注册
    [self.Loginview.signBtn addTarget:self action:@selector(signAction:) forControlEvents:UIControlEventTouchUpInside];   // 登录
}
#pragma marrk 注册 登陆方法
-(void)loginAction:(UIBarButtonItem *)sender{
    RegisterViewController * registerview = [[RegisterViewController alloc]init];
    
     [self.navigationController pushViewController:registerview animated:YES];
}
-(void)signAction:(UIBarButtonItem *)sender{
    TZWDBModel *fmdb = [[TZWDBModel alloc]init];
    if ([fmdb isExistsUserWithUname:self.Loginview.userTextField.text]) {
        NSArray *arr = [fmdb allloginUser:self.Loginview.userTextField.text];
        TUser * user = [[TUser alloc]init];
        user = arr[0];
        if(self.Loginview.pwdTextField.text == user.Upwd)
        {
            _almessage = @"确认登陆?";
        }
        else
        {
            _almessage = @"密码错误";
            
        }
    }
    else{
        _almessage = @"用户名已存在";
    }

    [self setalertcontroller];
    
   
   
}
-(void)setalertcontroller{
    UIAlertController * sinalert = [UIAlertController alertControllerWithTitle:@"提示" message:_almessage preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if ([_almessage  isEqual: @"确认登陆?"]) {
            MineViewController * mine = [[MineViewController alloc]init];
            MainViewController *main = [[MainViewController alloc]init];
            mine.name =self.Loginview.userTextField.text;
            [self.navigationController presentViewController:main animated:YES completion:nil];
        }
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [sinalert addAction:ok];
    [sinalert addAction:cancel];
    [self presentViewController:sinalert animated:YES completion:nil];
}
-(void)failAction:(UIAlertController *)alert{
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark 取消
-(void)leftAction:(UIBarButtonItem *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 忘记密码
-(void)rightAction:(UIBarButtonItem *)sender{
    ResetPwdViewController *re = [[ResetPwdViewController alloc]init];
    [self.navigationController presentViewController:re animated:YES completion:nil];
}
#pragma mark 键盘回收方法
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.Loginview.userTextField resignFirstResponder];
    [self.Loginview.pwdTextField resignFirstResponder];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.Loginview.signBtn setBackgroundImage:[UIImage imageFromColor:[UIColor colorWithRed:0.245 green:0.327 blue:0.589 alpha:0.900]] forState:UIControlStateNormal];
    return YES;
}
-(void)viewWillAppear:(BOOL)animated{
    self.rdv_tabBarController.tabBarHidden = YES;
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
