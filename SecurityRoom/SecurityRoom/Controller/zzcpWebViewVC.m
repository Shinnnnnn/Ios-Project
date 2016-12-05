//
//  zzcpWebViewVC.m
//  SecurityRoom
//
//  Created by 丁庆秋 on 16/6/17.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "zzcpWebViewVC.h"

#define zlbt @"http://221.6.15.170:18060/zhufang/surveyTest/list.html"  //租赁补贴
#define ggzl @"http://221.6.15.170:18060/zhufang/surveyTest/list02.html"  //公共租赁住房
#define gycq @"http://221.6.15.170:18060/zhufang/surveyTest/list01.html" //  共有产权住房

@interface zzcpWebViewVC()

@property(nonatomic,strong)UIImageView*barView;
@property(nonatomic,strong)UIButton*leftBtn;
@property(nonatomic,strong)UILabel*leftLabel;


@property(nonatomic,strong)UIActivityIndicatorView * activityIndicatorView;

@end

@implementation zzcpWebViewVC


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createLeftItem];

    
    NSURL * url;
    
    switch (_Tag)
    {
        case 0:
            url = [[NSURL alloc]initWithString: zlbt];
            break;
    
        case 1:
            url = [[NSURL alloc]initWithString: ggzl];
            break;
            
        case 2:
            url = [[NSURL alloc]initWithString: gycq];
            break;
            
        default:
            break;
    }
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc]
                             initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)] ;
    [_activityIndicatorView setCenter: self.view.center] ;
    [_activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleWhite] ;
    [self.view addSubview : _activityIndicatorView] ;
    
    UIWebView* webView = [[UIWebView alloc]initWithFrame: CGRectMake(0, self.navigationController.navigationBar.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - self.navigationController.navigationBar.frame.size.height)];
    
    webView.scalesPageToFit =YES;
    
    webView.delegate = self;
    
    
    [self.view addSubview : webView] ;
    
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    
}

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

#pragma mark- 导航栏左侧按钮
- (void)createLeftItem
{
    self.navigationItem.hidesBackButton = YES;
 
     _barView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.navigationController.navigationBar.frame.size.height)];
    _barView.userInteractionEnabled=YES;
    _barView.image = [UIImage imageNamed:@"bg_titlebar"];
    
    [self.navigationController.navigationBar addSubview:_barView];
    
    _leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    _leftBtn.frame=CGRectMake((20.0/750)*SCREEN_WIDTH, self.navigationController.navigationBar.frame.size.height/2-(48.0/2/1334)*SCREEN_HEIGHT, 55.0/750*SCREEN_WIDTH, 48.0/1334*SCREEN_HEIGHT);
    [_leftBtn setBackgroundImage:[UIImage imageNamed:@"ic_back_n"] forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(leftBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [_barView addSubview:_leftBtn];
    
    
     _leftLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, _barView.frame.size.width, _barView.frame.size.height)];
    [_leftLabel setTextAlignment:NSTextAlignmentCenter];
    _leftLabel.font=[UIFont systemFontOfSize:34/2];
    _leftLabel.textColor=[UIColor whiteColor];
    
    _leftLabel.text=@"自助测评";
    
    [_barView addSubview:_leftLabel];
    
}

- (void)leftBtnClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [_activityIndicatorView startAnimating] ;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activityIndicatorView stopAnimating];
}


@end
