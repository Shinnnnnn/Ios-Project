//
//  zzcpResultVC.m
//  SecurityRoom
//
//  Created by zte_gdy on 16/4/3.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "zzcpResultVC.h"

@interface zzcpResultVC ()
@property(nonatomic,strong)UIImageView*barView;
@property(nonatomic,strong)UIButton*leftBtn;
@property(nonatomic,strong)UILabel*leftLabel;
@end

@implementation zzcpResultVC
- (void)viewWillAppear:(BOOL)animated
{
    _barView.hidden=NO;
    _leftBtn.hidden=NO;
    _leftLabel.hidden=NO;
}
- (void)viewWillDisappear:(BOOL)animated
{
    _barView.hidden=YES;
    _leftBtn.hidden=YES;
    _leftLabel.hidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton=YES;
    self.view.backgroundColor=[UIColor whiteColor];
    [self createLeftItem];
    self.navigationItem.hidesBackButton=YES;
    UIImageView*bigImage=[[UIImageView alloc] initWithFrame:CGRectMake(50.0/750*SCREEN_WIDTH, 300.0/1334*SCREEN_HEIGHT, 188.0/750*SCREEN_WIDTH, 195.0/1334*SCREEN_HEIGHT)];
    if ([_detailDic[@"resultNote"] rangeOfString:@"不满足"].location !=NSNotFound)
    {
        bigImage.image=[UIImage imageNamed:@"ic_test_result_unpass"];
    }
    else
    {
        bigImage.image=[UIImage imageNamed:@"ic_test_result_pass"];
    }
    [self.view addSubview:bigImage];
    UILabel*resultLabel=[[UILabel alloc] initWithFrame:CGRectMake(bigImage.frame.origin.x+bigImage.frame.size.width+10.0/750*SCREEN_WIDTH, bigImage.frame.origin.y-20.0/1334*SCREEN_HEIGHT, SCREEN_WIDTH-(bigImage.frame.origin.x+bigImage.frame.size.width+50.0/750*SCREEN_WIDTH), 100.0/1334*SCREEN_HEIGHT)];
    resultLabel.text=_detailDic[@"resultNote"];
    resultLabel.textColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    resultLabel.numberOfLines=0;
    resultLabel.font=[UIFont systemFontOfSize:15];
    [self.view addSubview:resultLabel];
    UIImageView*smallImage=[[UIImageView alloc] initWithFrame:CGRectMake(bigImage.frame.origin.x+bigImage.frame.size.width, resultLabel.frame.origin.y+resultLabel.frame.size.height+20.0/1334*SCREEN_HEIGHT, 50.0/750*SCREEN_WIDTH, 50.0/1334*SCREEN_HEIGHT)];
    smallImage.image=[UIImage imageNamed:@"ic_tips"];
    [self.view addSubview:smallImage];
    UILabel *bottomLabel=[[UILabel alloc] initWithFrame:CGRectMake(smallImage.frame.origin.x+smallImage.frame.size.width+10.0/750*SCREEN_WIDTH, resultLabel.frame.origin.y+resultLabel.frame.size.height, resultLabel.frame.size.width-(smallImage.frame.size.width), 100.0/1334*SCREEN_HEIGHT)];
    bottomLabel.text=@"本测评仅供参考，最新标准以实际申请时为准。";
    bottomLabel.textColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    bottomLabel.numberOfLines=0;
    bottomLabel.font=[UIFont systemFontOfSize:13];
    [self.view addSubview:bottomLabel];
}
#pragma mark- 导航栏左侧按钮
- (void)createLeftItem
{
    _barView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.navigationController.navigationBar.frame.size.height)];
    _barView.userInteractionEnabled=YES;
    _barView.image=[UIImage imageNamed:@"bg_titlebar"];
    [self.navigationController.navigationBar addSubview:_barView];
    _leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame=CGRectMake((20.0/750)*SCREEN_WIDTH, self.navigationController.navigationBar.frame.size.height/2-(48.0/2/1334)*SCREEN_HEIGHT, 55.0/750*SCREEN_WIDTH, 48.0/1334*SCREEN_HEIGHT);
    [_leftBtn setBackgroundImage:[UIImage imageNamed:@"ic_back_n"] forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(leftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_barView addSubview:_leftBtn];    
    
    
    _leftLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, _barView.frame.size.width, _barView.frame.size.height)];
    [_leftLabel setTextAlignment:NSTextAlignmentCenter];
//    _leftLabel=[[UILabel alloc] initWithFrame:CGRectMake(_leftBtn.frame.origin.x+_leftBtn.frame.size.width+20.0/750*SCREEN_WIDTH, 0, SCREEN_WIDTH-(_leftBtn.frame.origin.x+_leftBtn.frame.size.width+20.0/750*SCREEN_WIDTH), _barView.frame.size.height)];
    
    _leftLabel.font=[UIFont systemFontOfSize:30/2];
    _leftLabel.textColor=[UIColor whiteColor];
    _leftLabel.numberOfLines=1;
    _leftLabelTitle = [_leftLabelTitle stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //去除掉首尾的空白字符和换行字符
    //    _leftLabelTitle = [ _leftLabelTitle stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    _leftLabelTitle = [ _leftLabelTitle stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    _leftLabel.text  = _leftLabelTitle;
    [_barView addSubview:_leftLabel];
}
- (void)leftBtnAction:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
