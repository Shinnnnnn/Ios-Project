//
//  secondVC.m
//  SecurityRoom
//
//  Created by zte_gdy on 16/3/31.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "secondVC.h"
#import "headerView.h"
#import "bzlxDetailVC.h"
#import "rdwdDetailVC.h"
#import "zzcpDetailVC.h"
#import "secondCell.h"
#import "AlertView.h"
#import "zzcpWebViewVC.h"

@interface secondVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIImageView*barView;
@property(nonatomic,strong)UIButton*leftBtn;
@property(nonatomic,strong)UILabel*leftLabel;
@end

@implementation secondVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton=YES;
    self.view.backgroundColor=[UIColor whiteColor];
    if (_leftTag==3)
    {
        AlertView * alert = [[AlertView alloc] init];
        [alert distributionNotesShow];
    }
    [self createLeftItem];
    [self createTableView];
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

- (void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    UITableView*myTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-(self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height)) style:UITableViewStylePlain];
    myTableView.delegate=self;
    myTableView.dataSource=self;
    myTableView.scrollEnabled=NO;
    myTableView.allowsSelection = NO;
    myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTableView];
    UIView*headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (500.0+20.0)/1334*SCREEN_WIDTH)];
    UIImageView*headerImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 500.0/1334*SCREEN_WIDTH)];
    if (_leftTag==1)
    {
        headerImage.image=[UIImage imageNamed:@"bg_bzlx_banner"];
    }
    else if (_leftTag==2)
    {
        headerImage.image=[UIImage imageNamed:@"bg_question_banner"];
    }
    else if (_leftTag==3)
    {
        headerImage.image=[UIImage imageNamed:@"bg_zzcp_banner"];
    }
    else
    {
        headerImage.image=[UIImage imageNamed:@"bg_about_banner"];
    }
    [headerView addSubview:headerImage];
    
    //联系我们模块没有这个色块
    if (_leftTag != 4)
    {
        UIImageView*colorImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 500.0/1334*SCREEN_WIDTH, SCREEN_WIDTH, 20.0/1334*SCREEN_WIDTH)];
        colorImage.image=[UIImage imageNamed:@"bg_color_bar"];
        [headerView addSubview:colorImage];
    }
 
    myTableView.tableHeaderView=headerView;
    [myTableView registerNib:[UINib nibWithNibName:@"secondCell" bundle:nil] forCellReuseIdentifier:@"secondCell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (_leftTag == 4)
    {
        return 30;
    }

    return 100.0/1334*SCREEN_HEIGHT;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_leftTag == 4)
    {
        return 0;
    }
    
    return 20.0/1334*SCREEN_HEIGHT;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    if (_leftTag == 4)
    {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        return view;
    }
    
    if (section==0)
    {
        headerView * hview = [[headerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100.0/1334*SCREEN_HEIGHT) withTitle:@"租赁补贴" ImageName:@"ic_zlbt"];
        UITapGestureRecognizer*zeroTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zeroSectionTap)];
        [hview addGestureRecognizer:zeroTap];
        return hview;
    }
    else if (section==1)
    {
        headerView * hview = [[headerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100.0/1334*SCREEN_HEIGHT) withTitle:@"公共租赁住房" ImageName:@"ic_ggzlzf"];
        if (_leftTag==2 || _leftTag == 3)
        {
            UITapGestureRecognizer*oneTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneSectionTap)];
            [hview addGestureRecognizer:oneTap];
        }
        return hview;
    }
    else if (section==2)
    {
        headerView * hview = [[headerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100.0/1334*SCREEN_HEIGHT) withTitle:@"共有产权保障房" ImageName:@"ic_gycqzf"];
        
        if (_leftTag==2 || _leftTag == 3)
        {
            UITapGestureRecognizer*twoTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoSectionTap)];
            [hview addGestureRecognizer:twoTap];
        }
        return hview;
    }
    else
    {
        headerView * hview = [[headerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100.0/1334*SCREEN_HEIGHT) withTitle:@"其他" ImageName:@"ic_other"];
        if (_leftTag==2)
        {
            UITapGestureRecognizer*threeTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(threeSectionTap)];
            [hview addGestureRecognizer:threeTap];
        }
        return hview;
    }
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
//    if (_leftTag == 4)
//    {
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
//        return view;
//    }
    
    UIImageView *footerView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20.0/1334*SCREEN_HEIGHT)];
    footerView.image=[UIImage imageNamed:@"ic_divider"];
    return footerView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_leftTag==2)
    {
        return 4;
    }
    else if(_leftTag == 4)
    {
        return 3;
    }
    else
    {
        return 3;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0||section==3)
    {
        if (_leftTag == 4 || _leftTag == 1)
        {
            //三个联系我们cell
            
            return 1;
        }
        return 0;
    }
    else
    {
        if (_leftTag==2 || _leftTag == 3)
        {
            return 0;
        }
        else
        {
           return 1;
        }
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_leftTag == 4)
    {
        
        UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"contactUsCell"];
     
        switch ([indexPath section])
        {
            case 0:
                cell.imageView.image = [UIImage imageNamed:@"ic_tel"];
                cell.textLabel.text = @"联系电话";
                cell.detailTextLabel.text = @"电话 : 84221312";
                
                break;
  
            case 1:
                cell.imageView.image = [UIImage imageNamed:@"ic_web"];
                cell.textLabel.text = @"网址";
                cell.detailTextLabel.text = @"http://fcj.nanjing.gov.cn/zfbz/";
                break;
                
            case 2:
                cell.imageView.image = [UIImage imageNamed:@"ic_addr"];
                cell.textLabel.text = @"地址";
                cell.detailTextLabel.text = @"南京市秦淮区丰富路127号";
                break;
            default:
                break;
        }
        
        CGRect frame = cell.frame;
        
        
        [cell setFrame:CGRectMake(frame.origin.x ,frame.origin.y, frame.size.width,frame.size.height + 100)];
        
        
        
        return cell;
    }
    
    secondCell*cell=[tableView dequeueReusableCellWithIdentifier:@"secondCell"];
    cell.topView.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    cell.leftView.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    cell.rightView.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    cell.leftBtn.titleLabel.numberOfLines=0;
    [cell.leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    cell.leftBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    [cell.midBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    cell.midBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    [cell.rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    cell.rightBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    
    
    
    if (indexPath.section==0)
    {
        [cell.leftBtn setTitle:@"城市中低收入\n住房困难家庭" forState:UIControlStateNormal];
        [cell.midBtn setTitle:@"新就业人员" forState:UIControlStateNormal];
        [cell.rightBtn setTitle:@"外来务工人员" forState:UIControlStateNormal];
        cell.leftBtn.tag=7;
        cell.midBtn.tag=8;
        cell.rightBtn.tag=9;
        [cell.leftBtn addTarget:self action:@selector(cellBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.midBtn addTarget:self action:@selector(cellBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.rightBtn addTarget:self action:@selector(cellBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if (indexPath.section==1)
    {
        [cell.leftBtn setTitle:@"城市中低收入\n住房困难家庭" forState:UIControlStateNormal];
        [cell.midBtn setTitle:@"新就业人员" forState:UIControlStateNormal];
        [cell.rightBtn setTitle:@"外来务工人员" forState:UIControlStateNormal];
        cell.leftBtn.tag=1;
        cell.midBtn.tag=2;
        cell.rightBtn.tag=3;
        [cell.leftBtn addTarget:self action:@selector(cellBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.midBtn addTarget:self action:@selector(cellBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.rightBtn addTarget:self action:@selector(cellBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if (indexPath.section==2)
    {
        [cell.leftBtn setTitle:@"城市中低收入\n住房困难家庭" forState:UIControlStateNormal];
        [cell.midBtn setTitle:@"首次置业家庭" forState:UIControlStateNormal];
        [cell.rightBtn setTitle:@"新就业人员" forState:UIControlStateNormal];
        cell.leftBtn.tag=4;
        cell.midBtn.tag=5;
        cell.rightBtn.tag=6;
        [cell.leftBtn addTarget:self action:@selector(cellBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.midBtn addTarget:self action:@selector(cellBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell.rightBtn addTarget:self action:@selector(cellBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    else{}
    return cell;
}
- (void)zeroSectionTap
{
    if (_leftTag==1)
    {
        [HttpManager requestBZLXWithcompletionBlock:^(NSDictionary *dic)
         {
             bzlxDetailVC*bzlxDetail=[[bzlxDetailVC alloc] init];
             bzlxDetail.detailDic=dic;
             bzlxDetail.leftLabelTitle=@"租赁补贴";
             [self.navigationController pushViewController:bzlxDetail animated:YES];
             
         }integer:0];
    }
    else if (_leftTag==2)
    {
        [HttpManager requestRDWDWithcompletionBlock:^(NSDictionary *dic)
         {
             rdwdDetailVC*rdwdDetail=[[rdwdDetailVC alloc] init];
             rdwdDetail.leftLabelTitle=@"租赁补贴";
             rdwdDetail.frontLeftLabelTitle=_leftLabel.text;
             rdwdDetail.detailDic=dic;
             [self.navigationController pushViewController:rdwdDetail animated:YES];
         } integer:0];
    }
    else if(_leftTag == 3)
    {
        zzcpWebViewVC *zzcpWEB = [[zzcpWebViewVC alloc]init];
        
        zzcpWEB.Tag = 0;
        
        [self.navigationController pushViewController:zzcpWEB animated:YES];
        
    }
    else
    {
        [HttpManager requestWTLBWithcompletionBlock:^(NSDictionary *dic)
        {
            zzcpDetailVC*zzcpDetail=[[zzcpDetailVC alloc] init];
            zzcpDetail.leftLabelTitle=@"租赁补贴";
            zzcpDetail.detailDic=dic;
            [self.navigationController pushViewController:zzcpDetail animated:YES];
        } integer:0];
    }
}
- (void)oneSectionTap
{
    
     if(_leftTag == 3)
    {
        zzcpWebViewVC *zzcpWEB = [[zzcpWebViewVC alloc]init];
        
        zzcpWEB.Tag = 1;
    
        [self.navigationController pushViewController:zzcpWEB animated:YES];

        return;
    }
    [HttpManager requestRDWDWithcompletionBlock:^(NSDictionary *dic)
     {
         rdwdDetailVC*rdwdDetail=[[rdwdDetailVC alloc] init];
         rdwdDetail.leftLabelTitle=@"公共租赁住房";
         rdwdDetail.frontLeftLabelTitle=_leftLabel.text;
         rdwdDetail.detailDic=dic;
         [self.navigationController pushViewController:rdwdDetail animated:YES];
     } integer:1];
}
- (void)twoSectionTap
{
    if(_leftTag == 3)
    {
        zzcpWebViewVC *zzcpWEB = [[zzcpWebViewVC alloc]init];
        
        zzcpWEB.Tag = 2;
        
        [self.navigationController pushViewController:zzcpWEB animated:YES];
        
        return;
        return;
    }
    
    [HttpManager requestRDWDWithcompletionBlock:^(NSDictionary *dic)
     {
         rdwdDetailVC*rdwdDetail=[[rdwdDetailVC alloc] init];
         rdwdDetail.leftLabelTitle=@"共有产权保障房";
         rdwdDetail.frontLeftLabelTitle=_leftLabel.text;
         rdwdDetail.detailDic=dic;
         [self.navigationController pushViewController:rdwdDetail animated:YES];
     } integer:2];
}
- (void)threeSectionTap
{
    [HttpManager requestRDWDWithcompletionBlock:^(NSDictionary *dic)
     {
         rdwdDetailVC*rdwdDetail=[[rdwdDetailVC alloc] init];
         rdwdDetail.leftLabelTitle=@"其他";
         rdwdDetail.frontLeftLabelTitle=_leftLabel.text;
         rdwdDetail.detailDic=dic;
         [self.navigationController pushViewController:rdwdDetail animated:YES];
     } integer:3];
}
- (void)cellBtnAction:(UIButton*)sender
{
    if (_leftTag==1)
    {
        UIButton*btn=[self.view viewWithTag:sender.tag];
        [HttpManager requestBZLXWithcompletionBlock:^(NSDictionary *dic)
         {
             bzlxDetailVC*bzlxDetail=[[bzlxDetailVC alloc] init];
             bzlxDetail.detailDic=dic;
             bzlxDetail.leftLabelTitle=btn.titleLabel.text;
             [self.navigationController pushViewController:bzlxDetail animated:YES];
             
         } integer:sender.tag];
    }
    if (_leftTag==3)
    {
         UIButton*btn=[self.view viewWithTag:sender.tag];
        [HttpManager requestWTLBWithcompletionBlock:^(NSDictionary *dic)
         {
             zzcpDetailVC*zzcpDetail=[[zzcpDetailVC alloc] init];
             zzcpDetail.leftLabelTitle=btn.titleLabel.text;
             zzcpDetail.detailDic=dic;
             [self.navigationController pushViewController:zzcpDetail animated:YES];
         } integer:sender.tag];
    }
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
    [_leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_barView addSubview:_leftBtn];
    
    
    _leftLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, _barView.frame.size.width, _barView.frame.size.height)];
    [_leftLabel setTextAlignment:NSTextAlignmentCenter];
    _leftLabel.font=[UIFont systemFontOfSize:34/2];
    _leftLabel.textColor=[UIColor whiteColor];
    
    
    if (_leftTag==1)
    {
        _leftLabel.text=@"保障类型";
    }
    else if (_leftTag==2)
    {
         _leftLabel.text=@"热点问答";
    }
    else if (_leftTag==4)
    {
        _leftLabel.text=@"联系我们";
    }
    else
    {
         _leftLabel.text=@"自助测评";
    }
    
    [_barView addSubview:_leftLabel];
}
- (void)leftBtnAction
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
