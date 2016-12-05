//
//  rdwdContentVC.m
//  SecurityRoom
//
//  Created by zte_gdy on 16/4/2.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "rdwdContentVC.h"
#import "NSString+calculate.h"

@interface rdwdContentVC ()//<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIImageView*barView;
@property(nonatomic,strong)UIButton*leftBtn;
@property(nonatomic,strong)UILabel*leftLabel;
//@property(nonatomic,strong)UITableView*myTableView;
@property(nonatomic,assign)float viewHeight;
@end

@implementation rdwdContentVC
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
    [self createLeftItem];
    self.navigationItem.hidesBackButton=YES;
    UIImageView*bgImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-( self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height))];
    bgImage.image=[UIImage imageNamed:@"bg_policy"];
    [self.view addSubview:bgImage];
    [self createHeaderView];
//    [self createTableView];
    [self createTextView];
}
- (void)createTextView
{
    UITextView*myTextView=[[UITextView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height+_viewHeight, SCREEN_WIDTH, SCREEN_HEIGHT-(self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height+_viewHeight))];
    myTextView.text=_cellContent;
    myTextView.backgroundColor=[UIColor clearColor];
    myTextView.editable=NO;
    myTextView.selectable=NO;
    myTextView.font=[UIFont systemFontOfSize:15];
    myTextView.textColor=[UIColor grayColor];
    [self.view addSubview:myTextView];
}
- (void)createHeaderView
{
    float titleHeight=[_sectionHeaderViewTitle heightWithWidth:SCREEN_WIDTH-(18.0/750*SCREEN_WIDTH+30.0/750*SCREEN_WIDTH) font:30/2];
     _viewHeight=titleHeight+20.0/1334*SCREEN_HEIGHT;
    UIView*headerView=[[UIView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height, SCREEN_WIDTH, _viewHeight)];
    headerView.backgroundColor=[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    UIImageView*leftImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18.0/750*SCREEN_WIDTH, _viewHeight)];
    leftImage.image=[UIImage imageNamed:[NSString stringWithFormat:@"bg_question_title.9"]];
    [headerView addSubview:leftImage];
    UILabel*rightLabel=[[UILabel alloc] initWithFrame:CGRectMake(leftImage.frame.size.width+10.0/750*SCREEN_WIDTH, 0, SCREEN_WIDTH-(leftImage.frame.size.width+30.0/750*SCREEN_WIDTH), _viewHeight)];
    rightLabel.text=_sectionHeaderViewTitle;
    rightLabel.textColor=[UIColor grayColor];
    rightLabel.font=[UIFont systemFontOfSize:30/2];
    rightLabel.numberOfLines=0;
    [headerView addSubview:rightLabel];
    [self.view addSubview:headerView];
}
//- (void)createTableView
//{
////    self.automaticallyAdjustsScrollViewInsets=NO;
//    _myTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height+_viewHeight, SCREEN_WIDTH, SCREEN_HEIGHT-(self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height+_viewHeight)) style:UITableViewStylePlain];
//    _myTableView.delegate=self;
//    _myTableView.dataSource=self;
//    _myTableView.backgroundColor=[UIColor clearColor];
//    _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//    [self.view addSubview:_myTableView];
//}
//- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    NSString *str = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];//以indexPath来唯一确定cell
//    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (!cell)
//    {
//        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//    cell.backgroundColor=[UIColor clearColor];
//    cell.textLabel.text=_cellContent;
//    cell.textLabel.numberOfLines=0;
//    cell.textLabel.textColor=[UIColor grayColor];
//    cell.textLabel.font=[UIFont systemFontOfSize:30/2];
//    cell.selectionStyle=UITableViewCellSelectionStyleNone;
//    return cell;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGFloat cellHeight=[_cellContent heightWithWidth:SCREEN_WIDTH-40.0/750*SCREEN_WIDTH font:30/2];
//    return cellHeight+100.0/1334*SCREEN_HEIGHT;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 1;
//}
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
