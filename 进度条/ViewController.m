//
//  ViewController.m
//  进度条
//
//  Created by huhang on 15/11/9.
//  Copyright (c) 2015年 huhang. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic,strong)ProgressView *progressView;
@property (nonatomic,strong)NSArray *titles;

@property (nonatomic,copy)NSString *finishStr;
@property (nonatomic,strong)UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 50, self.view.frame.size.width - 20 - 60, 50)];
    textField.placeholder = @"请输入数字";
    textField.delegate = self;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    self.textField = textField;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(CGRectGetMaxX(textField.frame) + 10, CGRectGetMinY(textField.frame), 50, 50);
    [button setTitle:@"确定" forState:UIControlStateNormal];
    button.layer.borderWidth = 0.5;
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.titles = @[@"沟通",@"票据",@"记账",@"报税",@"装订"];
    ProgressView *progressView = [ProgressView progressViewWithTitles:self.titles];
    [self.view addSubview:progressView];
    self.progressView = progressView;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
  
    self.finishStr = string;
    return YES;
}

- (void)buttonAction{

    NSInteger finishcount = [self.finishStr integerValue];
    if (self.finishStr.length > 0 && finishcount >= 0 && finishcount <= 5) {
       self.progressView.finishCount = finishcount;
    }else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"数据无效" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
        self.textField.text = nil;
    }
    
    [self.view endEditing:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
