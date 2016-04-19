//
//  RegisterViewController.m
//  Happyshops
//
//  Created by TanZhiWei on 16/4/2.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
@interface RegisterViewController ()<UITextFieldDelegate,RegisterViewDelegate>
@property(nonatomic,strong)RegisterView *regisview;
@property(nonatomic,strong)UIAlertController *alert;
@property(nonatomic,strong)UIButton * serviceTerms;
@property(nonatomic,retain)NSString * alertmessage;

@end

@implementation RegisterViewController
-(void)loadView{
    _regisview = [[RegisterView alloc]init];
    self.view = _regisview;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFromColor:[UIColor flatBlueColor]] forBarMetrics:UIBarMetricsCompact];
    self.regisview.backgroundColor = [UIColor whiteColor];
    
    _regisview.delegate = self;
    _regisview.UserNameText.delegate = self;
    _regisview.PwdText.delegate = self;
    _regisview.AgainPwdText.delegate = self;
    
    self.serviceTerms = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.height*30/667, [UIScreen mainScreen].bounds.size.height*400/667, [UIScreen mainScreen].bounds.size.height*300/667, [UIScreen mainScreen].bounds.size.height*30/667)];
    [self.serviceTerms.titleLabel setFont:[UIFont fontWithName:@"Menlo" size:[UIScreen mainScreen].bounds.size.height*14/667]];
    [self.serviceTerms setTitle:@"注册表示您已阅读并同意服务条款" forState:UIControlStateNormal];
    [self.serviceTerms setTitleColor:[UIColor colorWithRed:0.243 green:0.322 blue:0.573 alpha:0.700] forState:UIControlStateNormal];
    [self.serviceTerms setTitleColor:[UIColor flatBlueColor] forState:UIControlStateHighlighted];
    [self.regisview addSubview:_serviceTerms];
    [self.serviceTerms addTarget:self action:@selector(pushToOther:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.height*75/667, [UIScreen mainScreen].bounds.size.height*425/667, [UIScreen mainScreen].bounds.size.height*210/667, [UIScreen mainScreen].bounds.size.height*1/667)];
    label.backgroundColor = [UIColor colorWithRed:0.243 green:0.322 blue:0.573 alpha:0.700];
    [self.regisview addSubview:label];
    

}
- (void)pushToOther:(UIButton *)sender {
//    ServiceViewController *serveice = [[ServiceViewController alloc] init];
//    
//    [self.navigationController pushViewController:serveice  animated:YES];
}

//控制*的出现和消失
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([_regisview.UserNameText.text length]>0)
    {
        _regisview.UserNull.text = @"";
    }
    else
    {
        _regisview.UserNull.text = @"*";
    }
    
    if ([_regisview.PwdText.text length]>0)
    {
        _regisview.PwdrNull.text = @"";
    }
    else
    {
        _regisview.PwdrNull.text = @"*";
    }
    if ([_regisview.AgainPwdText.text length]>0)
    {
        _regisview.AgainPwdNull.text = @"";
    }
    else
    {
        _regisview.AgainPwdNull.text = @"*";
    }
    if ([_regisview.MailText.text length]>0)
    {
        _regisview.MailNull.text = @"";
    }
    else
    {
        _regisview.MailNull.text = @"*";
    }
    //设置textfiled的输入长度
    if ([textField.text length] < 6)
    {
       
    }
    if ([textField.text length] > 12)
    {
       
    }
    
}
//判断邮箱是否合法
- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}
//键盘回收
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.regisview.UserNameText resignFirstResponder];
    [self.regisview.PwdText resignFirstResponder];
    [self.regisview.AgainPwdText resignFirstResponder];
    [self.regisview.MailText resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_regisview.UserNameText resignFirstResponder];
    [_regisview.PwdText resignFirstResponder];
    [_regisview.AgainPwdText resignFirstResponder];
    [_regisview.MailText resignFirstResponder];
    return YES;
}
- (void)reset {
    _regisview.UserNameText.text = nil;
    _regisview.PwdText.text = nil;
    _regisview.AgainPwdText.text = nil;
    _regisview.MailText.text = nil;
}

- (void)login {
    //设置textfiled不能为空
    if ([_regisview.UserNameText.text isEqualToString: @""] || [_regisview.PwdText.text isEqualToString: @""]||[_regisview.MailText.text isEqualToString:@""])
    {
         _alertmessage = @"用户名.邮箱或密码不能为空!";
        [self Setalertcontrol];
        [self presentViewController:_alert animated:YES completion:nil];
        
    }
    else
    {
        //判断邮箱格式是否正确
        BOOL y = [self validateEmail:_regisview.MailText.text];
        if (y == 0)
        {
            _alertmessage = @"邮箱格式不正确!";
            [self Setalertcontrol];
            [self presentViewController:_alert animated:YES completion:nil];
        }
        else
        {
            if (![_regisview.PwdText.text isEqualToString:_regisview.AgainPwdText.text])
            {
                _alertmessage = @"两次输入密码不一致!";
                [self Setalertcontrol];
                [self presentViewController:_alert animated:YES completion:nil];
            }
            
            if ((![_regisview.UserNameText.text isEqualToString:@""]) &&[_regisview.PwdText.text isEqualToString:_regisview.AgainPwdText.text])
            {
                TZWDBModel *fmdb = [[TZWDBModel alloc]init];
                TUser *user = [[TUser alloc]init];
                user.Uname = _regisview.UserNameText.text;
                user.Upwd = _regisview.PwdText.text;
                user.UEmail = _regisview.MailText.text;
                BOOL isexi = [fmdb isExistsUserWithUname:_regisview.UserNameText.text];
                if (!isexi) {
                    [fmdb insertUserTable:user];
                   _alertmessage = @"注册成功";
                    [self Setalertcontrol];
                }
                else{
                     _alertmessage = @"用户名已存在";
                    [self Setalertcontrol];
                }
                [self presentViewController:_alert animated:YES completion:nil];
             }
            
            
        }
        
    }
}
-(void)Setalertcontrol{
    _alert = [UIAlertController alertControllerWithTitle:@"提示" message:_alertmessage preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"注意学习");
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [_alert addAction:ok];
    [_alert addAction:cancel];

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
