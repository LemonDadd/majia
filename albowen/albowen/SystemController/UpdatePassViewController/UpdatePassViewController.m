//
//  UpdatePassViewController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/9.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "UpdatePassViewController.h"

@interface UpdatePassViewController ()
@property (weak, nonatomic) IBOutlet UILabel *text1;
@property (weak, nonatomic) IBOutlet UILabel *text2;
@property (weak, nonatomic) IBOutlet UILabel *text3;
@property (weak, nonatomic) IBOutlet UITextField *oldPass;
@property (weak, nonatomic) IBOutlet UITextField *passNew;
@property (weak, nonatomic) IBOutlet UITextField *confirmPass;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;

@end

@implementation UpdatePassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"เปลี่ยนรหัสผ่าน";
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = kColorWithHex(0xf9f9f9);
    
    UIFont *font = [UIFont fontByName:@"" fontSize:18];
    self.text1.font = font;
    self.text2.font = font;
    self.text3.font = font;
    self.oldPass.font = font;
    self.oldPass.secureTextEntry = YES;
    self.passNew.font = font;
    self.passNew.secureTextEntry = YES;
    self.confirmPass.font = font;
    self.confirmPass.secureTextEntry = YES;
    
    self.subBtn.layer.cornerRadius =5;
    self.subBtn.layer.masksToBounds =YES;
    [self.subBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.subBtn.backgroundColor = kColorWithHex(MCOLOR);
    self.subBtn.titleLabel.font = [UIFont fontByName:@"" fontSize:18];
    [self.subBtn addTarget:self action:@selector(subBtnEvent) forControlEvents:UIControlEventTouchUpInside];
}

- (void)subBtnEvent {
    if (self.oldPass.text.length == 0) {
        [CustomView alertMessage:@"กรุณาตรวจสอบ" view:self.view];
        return;
    }
    if (self.passNew.text.length == 0) {
        [CustomView alertMessage:@"กรุณาตรวจสอบ" view:self.view];
        return;
    }
    if (self.confirmPass.text.length == 0) {
        [CustomView alertMessage:@"กรุณาตรวจสอบ" view:self.view];
        return;
    }
    
    if (![self.passNew.text isEqualToString:self.confirmPass.text]) {
        [CustomView alertMessage:@"กรุณาตรวจสอบ" view:self.view];
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [CustomView alertMessage:@"ประสบความสําเร็จ" view:self.view];
    });
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
