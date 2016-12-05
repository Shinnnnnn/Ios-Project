//
//  ViewController.m
//  SecurityRoom
//
//  Created by LJ on 16/3/31.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "ViewController.h"
#import "secondVC.h"
#import "HttpManager.h"
@interface ViewController ()
@property(nonatomic,strong)UIImageView*barView;
@property(nonatomic,strong)UIImageView*titleImave;
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    UIView *whiteView=[[UIView alloc] initWithFrame:CGRectMake(0, -[UIApplication sharedApplication].statusBarFrame.size.height, SCREEN_WIDTH, [UIApplication sharedApplication].statusBarFrame.size.height)];
    whiteView.backgroundColor=[UIColor whiteColor];
    [self.navigationController.navigationBar addSubview:whiteView];
    
    _barView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.navigationController.navigationBar.frame.size.height)];
    _barView.image=[UIImage imageNamed:@"bg_titlebar"];
    [self.navigationController.navigationBar addSubview:_barView];
    _titleImave=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 295.0/750*SCREEN_WIDTH, 75.0/1334*SCREEN_HEIGHT)];
    _titleImave.image=[UIImage imageNamed:@"ic_title"];
    _titleImave.center=_barView.center;
    [_barView addSubview:_titleImave];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [_barView removeFromSuperview];
    [_titleImave removeFromSuperview];
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImageView*bgImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-[UIApplication sharedApplication].statusBarFrame.size.height)];
    bgImage.image=[UIImage imageNamed:@"bg_main"];
    [self.view addSubview:bgImage];
    UIImageView*leftImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 350.0/1334*SCREEN_HEIGHT, 316.0/750*SCREEN_WIDTH, 684.0/1334*SCREEN_HEIGHT)];
    leftImage.image=[UIImage imageNamed:@"ic_main_left"];
    [self.view addSubview:leftImage];
    
    
    //四个模块
    UIButton*bzlxBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    bzlxBtn.frame=CGRectMake(100.0/750*SCREEN_WIDTH, 250.0/1334*SCREEN_HEIGHT, 421.0/750*SCREEN_WIDTH, 129.0/1334*SCREEN_HEIGHT);
    [bzlxBtn setImage:[UIImage imageNamed:@"ic_main_bzlx"] forState:UIControlStateNormal];
    [bzlxBtn addTarget:self action:@selector(BtnAction:) forControlEvents:UIControlEventTouchUpInside];
    bzlxBtn.tag=1;
    bzlxBtn.adjustsImageWhenHighlighted=NO;
    [self.view addSubview:bzlxBtn];
    
    UIButton*rdwdBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rdwdBtn.frame=CGRectMake(250.0/750*SCREEN_WIDTH, 500.0/1334*SCREEN_HEIGHT, 421.0/750*SCREEN_WIDTH, 129.0/1334*SCREEN_HEIGHT);
    [rdwdBtn setImage:[UIImage imageNamed:@"ic_main_rdwd"] forState:UIControlStateNormal];
    [rdwdBtn addTarget:self action:@selector(BtnAction:) forControlEvents:UIControlEventTouchUpInside];
    rdwdBtn.tag=2;
    rdwdBtn.adjustsImageWhenHighlighted=NO;
    [self.view addSubview:rdwdBtn];
    
    UIButton*zzcpBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    zzcpBtn.frame=CGRectMake(200.0/750*SCREEN_WIDTH, 750.0/1334*SCREEN_HEIGHT, 421.0/750*SCREEN_WIDTH, 129.0/1334*SCREEN_HEIGHT);
    [zzcpBtn setImage:[UIImage imageNamed:@"ic_main_zzcp"] forState:UIControlStateNormal];
    [zzcpBtn addTarget:self action:@selector(BtnAction:) forControlEvents:UIControlEventTouchUpInside];
    zzcpBtn.tag=3;
    zzcpBtn.adjustsImageWhenHighlighted=NO;
    [self.view addSubview:zzcpBtn];
    
    
    UIButton*contactUsBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    contactUsBtn.frame=CGRectMake(100.0/750*SCREEN_WIDTH, 1000.0/1334*SCREEN_HEIGHT, 421.0/750*SCREEN_WIDTH, 129.0/1334*SCREEN_HEIGHT);
    [contactUsBtn setImage:[UIImage imageNamed:@"ic_main_lxwm"] forState:UIControlStateNormal];
    [contactUsBtn addTarget:self action:@selector(BtnAction:) forControlEvents:UIControlEventTouchUpInside];
    contactUsBtn.tag=4;
    contactUsBtn.adjustsImageWhenHighlighted=NO;
    [self.view addSubview:contactUsBtn];
}
- (void)BtnAction:(UIButton*)sender
{
    secondVC*second=[[secondVC alloc] init];
    
    second.leftTag = (int)sender.tag;
    [self.navigationController pushViewController:second animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
