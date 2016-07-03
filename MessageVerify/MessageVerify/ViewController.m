//
//  ViewController.m
//  MessageVerify
//
//  Created by myth on 2/7/16.
//  Copyright © 2016 myth. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Verify.h"
#import <SMS_SDK/SMSSDK.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *VerifyNumTextField;

/**
 *  记录手机号码
 */
@property(nonatomic, copy) NSString *phoneNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
/**
 *  获取短信验证码
 */
- (IBAction)getMsgVerifyCode:(id)sender {
    // 1. 验证手机号码是否合法
    if (!self.phoneTextField.text.isPhone) {
        NSLog(@"你的电话号码有误,请重新录入");
        return;
    }
    
    self.phoneNumber = self.phoneTextField.text;
    //    SMSGetCodeMethodSMS = 0,  //文本短信方式
    //    SMSGetCodeMethodVoice = 1 //语音方式
    /**
     *  @from                    v1.1.1
     *  @brief                   获取验证码(Get verification code)
     *
     *  @param method            获取验证码的方法(The method of getting verificationCode)
     *  @param phoneNumber       电话号码(The phone number)
     *  @param zone              区域号，不要加"+"号(Area code)
     *  @param customIdentifier  自定义短信模板标识 该标识需从官网http://www.mob.com上申请，审核通过后获得。(Custom model of SMS.  The identifier can get it  from http://www.mob.com  when the application had approved)
     *  @param result            请求结果回调(Results of the request)
     */
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumber  zone:@"86"
    customIdentifier:nil  result:^(NSError *error){
        if (!error) {
            NSLog(@"获取验证码成功");
        } else {
            NSLog(@"错误信息：%@",error);
        }
    }];
}

/**
 *  提交验证
 */
- (IBAction)commit:(id)sender {
    
    if (self.VerifyNumTextField.text.length != 4) {
        NSLog(@"你验证码输入有误");
        return;
    }

    /**
     * @from               v1.1.1
     * @brief              提交验证码(Commit the verification code)
     *
     * @param code         验证码(Verification code)
     * @param phoneNumber  电话号码(The phone number)
     * @param zone         区域号，不要加"+"号(Area code)
     * @param result       请求结果回调(Results of the request)
     */
    [SMSSDK commitVerificationCode:self.VerifyNumTextField.text phoneNumber:self.phoneNumber zone:@"86" result:^(NSError *error) {
        
        if (!error) {
            NSLog(@"验证成功");
        }
        else{
            NSLog(@"错误信息：%@",error);
        }
    }];
}

/**
 *  获取语音验证码
 */
- (IBAction)getVoiceVerifyCode:(id)sender {
    // 1. 验证手机号码是否合法
    if (!self.phoneTextField.text.isPhone) {
        NSLog(@"你的电话号码有误,请重新录入");
        return;
    }
    
    self.phoneNumber = self.phoneTextField.text;
    //    SMSGetCodeMethodSMS = 0,  //文本短信方式
    //    SMSGetCodeMethodVoice = 1 //语音方式
 
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodVoice phoneNumber:self.phoneNumber  zone:@"86"
                       customIdentifier:nil  result:^(NSError *error){
                           if (!error) {
                               NSLog(@"获取验证码成功");
                           } else {
                               NSLog(@"错误信息：%@",error);
                           }
                       }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
