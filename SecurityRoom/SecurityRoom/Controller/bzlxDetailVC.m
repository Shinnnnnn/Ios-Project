//
//  bzlxDetailVC.m
//  SecurityRoom
//
//  Created by zte_gdy on 16/4/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "bzlxDetailVC.h"
#import "NSString+calculate.h"
#define LINESPACE 10
@interface bzlxDetailVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIImageView*barView;
@property(nonatomic,strong)UIButton*leftBtn;
@property(nonatomic,strong)UILabel*leftLabel;
@property(nonatomic,strong)UITableView*myTableView;
@property(nonatomic,assign)NSInteger currentSeclectSection;// 当前选中区
@property(nonatomic,strong)NSMutableArray*currentSelectSectionArr;
@property(nonatomic,strong)NSString*cellStr;
@property(nonatomic,strong)NSMutableArray*dataArr;
@end

@implementation bzlxDetailVC
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
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView*bgImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-( self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height))];
    bgImage.image=[UIImage imageNamed:@"bg_policy"];
    [self.view addSubview:bgImage];
    _dataArr=[[NSMutableArray alloc] init];
    _dataArr=_detailDic[@"detail"][@"list"];
    _currentSelectSectionArr=[[NSMutableArray alloc] init];
    self.navigationItem.hidesBackButton=YES;
    self.view.backgroundColor=[UIColor whiteColor];
    [self createLeftItem];
    [self createTableView];
}
- (void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    _myTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-(self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height)) style:UITableViewStylePlain];
    _myTableView.delegate=self;
    _myTableView.dataSource=self;
    _myTableView.backgroundColor=[UIColor clearColor];
    _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _myTableView.bounces=NO;
    _myTableView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_myTableView];
    UIView*footerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    footerView.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    _myTableView.tableFooterView=footerView;
    [_myTableView registerNib:[UINib nibWithNibName:@"secondCell" bundle:nil] forCellReuseIdentifier:@"secondCell"];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.numberOfLines=0;
    cell.textLabel.textColor=[UIColor grayColor];
    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.text=_dataArr[indexPath.section][@"content"];
    _cellStr=cell.textLabel.text;
    cell.textLabel.font=[UIFont systemFontOfSize:30/2];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    //调整行间距
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:cell.textLabel.text];
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    [paragraphStyle setLineSpacing:LINESPACE];
//    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [cell.textLabel.text length])];
//    cell.textLabel.attributedText = attributedString;
//    [cell.textLabel sizeToFit];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight=[_cellStr heightWithWidth:SCREEN_WIDTH-40.0/750*SCREEN_WIDTH font:30/2];
    return cellHeight+80.0/1334*SCREEN_HEIGHT;
}
#pragma mark------自定义区头设置
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 把区头设置为 button
    UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton*leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(0, 0, 42.0/750*SCREEN_WIDTH, 67.0/1334*SCREEN_HEIGHT);
    [leftBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"bg_item_title_0%d",section+1]] forState:UIControlStateNormal];
    [leftBtn setTitle:[NSString stringWithFormat:@"%ld",section+1] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    leftBtn.titleLabel.font=[UIFont systemFontOfSize:30/2];
    leftBtn.userInteractionEnabled=NO;
    [btn addSubview:leftBtn];
    UILabel*rightLabel=[[UILabel alloc] initWithFrame:CGRectMake(leftBtn.frame.origin.x+leftBtn.frame.size.width+20.0/750*SCREEN_WIDTH, 0, 300.0/750*SCREEN_WIDTH, leftBtn.frame.size.height)];
    rightLabel.text=_dataArr[section][@"name"];
    rightLabel.textColor=[UIColor grayColor];
    rightLabel.font=[UIFont systemFontOfSize:30/2];
    [btn addSubview:rightLabel];
    UIView*topView=[[UIView alloc] initWithFrame:CGRectMake(leftBtn.frame.origin.x+leftBtn.frame.size.width, 0, SCREEN_WIDTH-(leftBtn.frame.origin.x+leftBtn.frame.size.width), 0.5)];
    topView.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    [btn addSubview:topView];
    [btn addTarget:self action:@selector(headerClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag=section;
    btn.backgroundColor=[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    return btn;
}
#pragma mark------返回每个区有多少行(表的折合)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 展开
    if ([_currentSelectSectionArr containsObject:[NSString stringWithFormat:@"%ld",section]])
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
#pragma mark--------点击区头展开各行的内容
- (void)headerClick:(UIButton*)btn
{
   
    if ([_currentSelectSectionArr containsObject:[NSString stringWithFormat:@"%ld",btn.tag]])
    {
        [_currentSelectSectionArr removeObject:[NSString stringWithFormat:@"%ld",btn.tag]];
    }
    else
    {
       [_currentSelectSectionArr addObject:[NSString stringWithFormat:@"%ld",btn.tag]];
    }
    [_myTableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArr.count;
}
#pragma mark-------设置区头行高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 67.0/1334*SCREEN_HEIGHT;
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
//    
//    _leftLabel=[[UILabel alloc] initWithFrame:CGRectMake(_leftBtn.frame.origin.x+_leftBtn.frame.size.width+20.0/750*SCREEN_WIDTH, 0, SCREEN_WIDTH-(_leftBtn.frame.origin.x+_leftBtn.frame.size.width+20.0/750*SCREEN_WIDTH), _barView.frame.size.height)];
    
    
    _leftLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, _barView.frame.size.width, _barView.frame.size.height)];
    [_leftLabel setTextAlignment:NSTextAlignmentCenter];
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
