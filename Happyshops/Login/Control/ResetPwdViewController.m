//
//  ResetPwdViewController.m
//  Happyshops
//
//  Created by TanZhiWei on 16/4/2.
//  Copyright © 2016年 TanZhiWei. All rights reserved.
//

#import "ResetPwdViewController.h"

@interface ResetPwdViewController ()
@property(nonatomic,retain)resetPwdview *review;
@end

@implementation ResetPwdViewController
-(void)loadView{
    self.review = [[resetPwdview alloc]init];
    self.view =_review;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self p_setData];
}
- (void)p_setData
{
    self.review.emailLabel.text = @"邮箱验证:";
    self.review.emailTextField.placeholder = @"请输入注册邮箱";
    [self.review.sureBtn setTitle:@"下一步" forState:UIControlStateNormal];
    self.review.sureBtn.backgroundColor = [UIColor flatBlueColor];
    [self.review.sureBtn addTarget:self action:@selector(sureBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.review.cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    self.review.cancleBtn.backgroundColor = [UIColor flatBlueColor];
    [self.review.cancleBtn addTarget:self action:@selector(cancleBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)cancleBtn:(UIButton *)sender
{
    [self dismissKeyboard:self.review.emailTextField];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)dismissKeyboard:(id)sender {
    [sender resignFirstResponder];
}

#pragma mark  键盘回收方法
//键盘回收
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.review.emailTextField resignFirstResponder];
}
- (void)sureBtn:(UIButton *)sender
{
//    [AVUser requestPasswordResetForEmailInBackground:self.re.emailTextField.text block:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"进入邮箱验证" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//            [alert show];
//        } else {
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"验证失败" message:@"请输入正确邮箱" delegate:self cancelButtonTitle:@"确定"otherButtonTitles:nil, nil];
//            [alert show];
//        }
 //   }];
}

-(void)setAlertView{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"注意学习");
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [alert addAction:ok];
    [alert addAction:cancel];

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
