//
//  zzcpDetailVC.m
//  SecurityRoom
//
//  Created by zte_gdy on 16/4/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "zzcpDetailVC.h"
#import "NSString+calculate.h"
#import "zzcpResultVC.h"
@interface zzcpDetailVC ()
@property(nonatomic,strong)UIImageView*barView;
@property(nonatomic,strong)UIButton*leftBtn;
@property(nonatomic,strong)UILabel*leftLabel;
@property(nonatomic,assign)float viewHeight;
//@property(nonatomic,assign)NSString*questionTitle;
@property(nonatomic,strong)UIView*headerView;
@property(nonatomic,strong)UIView *chooseView;
@property(nonatomic,strong)UIButton*yesBtn;
@property(nonatomic,strong)UIButton*noBtn;
@property(nonatomic,strong)UIButton*leftHeaderViewBtn;
@property(nonatomic,strong)UILabel*rightLabel;
@property(nonatomic,strong)NSMutableArray*dataArr;
@property(nonatomic,assign)NSInteger currentPage;
@property (nonatomic,assign)NSInteger jishiTime;
@property (nonatomic,strong)NSTimer*myTimer;
@property(nonatomic,strong)NSMutableArray*resultArr;
@property(nonatomic,strong)NSMutableDictionary*smallDic;
@property(nonatomic,assign)NSInteger chooseInteger;
@end

@implementation zzcpDetailVC
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
    UIImageView*bgImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-( self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height))];
    bgImage.image=[UIImage imageNamed:@"bg_test"];
    [self.view addSubview:bgImage];
    _resultArr=[[NSMutableArray alloc] init];
    _dataArr=[[NSMutableArray alloc] init];
    _dataArr=_detailDic[@"detail"][@"list"];
    _currentPage=0;
    _yesBtn.selected=NO;
    _noBtn.selected=NO;
    [self createHeaderView];
    [self createChooseView];
}
- (void)createChooseView
{
    _chooseView=[[UIView alloc] initWithFrame:CGRectMake(0, _headerView.frame.origin.y+_headerView.frame.size.height+20.0/1334*SCREEN_HEIGHT, SCREEN_WIDTH, 300.0/1334*SCREEN_HEIGHT)];
    [self.view addSubview:_chooseView];
    _yesBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _yesBtn.selected=NO;
    _yesBtn.frame=CGRectMake(20.0/750*SCREEN_WIDTH, 20.0/1334*SCREEN_HEIGHT, 150.0/750*SCREEN_WIDTH, 80.0/1334*SCREEN_HEIGHT);
    [_yesBtn setImage:[UIImage imageNamed:@"ic_unchecked"] forState:UIControlStateNormal];
    _yesBtn.imageEdgeInsets=UIEdgeInsetsMake(20.0/1334*SCREEN_HEIGHT, 20.0/750*SCREEN_WIDTH, 20.0/1334*SCREEN_HEIGHT, 90.0/750*SCREEN_WIDTH);
    [_yesBtn setTitle:@"是" forState:UIControlStateNormal];
    _yesBtn.titleLabel.textAlignment=NSTextAlignmentRight;
    _yesBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [_yesBtn setTitleColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] forState:UIControlStateNormal];
    _yesBtn.titleEdgeInsets=UIEdgeInsetsMake(0,0, 0, 0);
    [_yesBtn addTarget:self action:@selector(btnActioon:) forControlEvents:UIControlEventTouchUpInside];
    _yesBtn.tag=1;
    [_chooseView addSubview:_yesBtn];
    _noBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _noBtn.frame=CGRectMake(_yesBtn.frame.origin.x+_yesBtn.frame.size.width+20.0/750*SCREEN_WIDTH, _yesBtn.frame.origin.y, _yesBtn.frame.size.width, _yesBtn.frame.size.height);
    _noBtn.imageEdgeInsets=UIEdgeInsetsMake(20.0/1334*SCREEN_HEIGHT, 20.0/750*SCREEN_WIDTH, 20.0/1334*SCREEN_HEIGHT, 90.0/750*SCREEN_WIDTH);
    [_noBtn setTitle:@"否" forState:UIControlStateNormal];
    _noBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [_noBtn setTitleColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] forState:UIControlStateNormal];
    _noBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 0);
    _noBtn.selected=NO;
    [_noBtn setImage:[UIImage imageNamed:@"ic_unchecked"] forState:UIControlStateNormal];
    [_noBtn addTarget:self action:@selector(btnActioon:) forControlEvents:UIControlEventTouchUpInside];
    _noBtn.tag=2;
    [_chooseView addSubview:_noBtn];
    
    
    UIButton*lastStepBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton*nextStepBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    UIButton*submitBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    if (_currentPage==_dataArr.count-1)
    {
        lastStepBtn.frame=CGRectMake(SCREEN_WIDTH-180.0/750*SCREEN_WIDTH*3-10.0/750*SCREEN_WIDTH*2-20.0/750*SCREEN_WIDTH, _yesBtn.frame.origin.y+_yesBtn.frame.size.height+40.0/1334*SCREEN_HEIGHT, 180.0/750*SCREEN_WIDTH, 80.0/1334*SCREEN_HEIGHT);
        nextStepBtn.frame=CGRectMake(lastStepBtn.frame.origin.x+lastStepBtn.frame.size.width+10.0/750*SCREEN_WIDTH, lastStepBtn.frame.origin.y, lastStepBtn.frame.size.width, lastStepBtn.frame.size.height);
        submitBtn.frame=CGRectMake(nextStepBtn.frame.origin.x+nextStepBtn.frame.size.width+10.0/750*SCREEN_WIDTH, lastStepBtn.frame.origin.y, lastStepBtn.frame.size.width, lastStepBtn.frame.size.height);
    }
    else
    {
        lastStepBtn.frame=CGRectMake(SCREEN_WIDTH-180.0/750*SCREEN_WIDTH*2-10.0/750*SCREEN_WIDTH*1-20.0/750*SCREEN_WIDTH, _yesBtn.frame.origin.y+_yesBtn.frame.size.height+40.0/1334*SCREEN_HEIGHT, 180.0/750*SCREEN_WIDTH, 80.0/1334*SCREEN_HEIGHT);
        nextStepBtn.frame=CGRectMake(lastStepBtn.frame.origin.x+lastStepBtn.frame.size.width+10.0/750*SCREEN_WIDTH, lastStepBtn.frame.origin.y, lastStepBtn.frame.size.width, lastStepBtn.frame.size.height);
//        submitBtn.frame=CGRectMake(nextStepBtn.frame.origin.x+nextStepBtn.frame.size.width+10.0/750*SCREEN_WIDTH, lastStepBtn.frame.origin.y, lastStepBtn.frame.size.width, lastStepBtn.frame.size.height);
    }
    lastStepBtn.layer.masksToBounds=YES;
    lastStepBtn.layer.cornerRadius=2;
    lastStepBtn.layer.borderWidth=1;
    if (_currentPage==0)
    {
        lastStepBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
        lastStepBtn.backgroundColor=[UIColor lightGrayColor];
        lastStepBtn.userInteractionEnabled=NO;
    }
    else
    {
        lastStepBtn.layer.borderColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0].CGColor;
        lastStepBtn.backgroundColor=[UIColor whiteColor];
        lastStepBtn.userInteractionEnabled=YES;
    }
    lastStepBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [lastStepBtn setTitle:@"上一步" forState:UIControlStateNormal];
    [lastStepBtn setTitleColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] forState:UIControlStateNormal];
    [lastStepBtn addTarget:self action:@selector(btnActioon:) forControlEvents:UIControlEventTouchUpInside];
    lastStepBtn.tag=3;
    [_chooseView addSubview:lastStepBtn];
    
    nextStepBtn.layer.masksToBounds=YES;
    nextStepBtn.layer.cornerRadius=2;
    nextStepBtn.layer.borderWidth=1;
    if (_currentPage==_dataArr.count-1)
    {
        nextStepBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
        nextStepBtn.backgroundColor=[UIColor lightGrayColor];
        nextStepBtn.userInteractionEnabled=NO;
    }
    else
    {
        nextStepBtn.layer.borderColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0].CGColor;
        nextStepBtn.backgroundColor=[UIColor whiteColor];
        nextStepBtn.userInteractionEnabled=YES;
    }
    nextStepBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [nextStepBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextStepBtn setTitleColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] forState:UIControlStateNormal];

    [nextStepBtn addTarget:self action:@selector(btnActioon:) forControlEvents:UIControlEventTouchUpInside];
    nextStepBtn.tag=4;
    [_chooseView addSubview:nextStepBtn];
    submitBtn.backgroundColor=[UIColor colorWithRed:236/255.0 green:77/255.0 blue:57/255.0 alpha:1.0];
    submitBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(btnActioon:) forControlEvents:UIControlEventTouchUpInside];
    submitBtn.tag=5;
    [_chooseView addSubview:submitBtn];
    if (_dataArr==nil)
    {
        _yesBtn.userInteractionEnabled=NO;
        _noBtn.userInteractionEnabled=NO;
    }
}
- (void)btnActioon:(UIButton*)sender
{
    switch (sender.tag)
    {
        case 1://是---0
        {
            if (_yesBtn.selected==NO)
            {
                if (_noBtn.selected==NO)
                {
                    [_yesBtn setImage:[UIImage imageNamed:@"ic_checked"] forState:UIControlStateNormal];
                }
                else
                {
                    [_yesBtn setImage:[UIImage imageNamed:@"ic_checked"] forState:UIControlStateNormal];
                    [_noBtn setImage:[UIImage imageNamed:@"ic_unchecked"] forState:UIControlStateNormal];
                    _noBtn.selected=NO;
                }
                _yesBtn.selected=YES;
                _chooseInteger=0;
                // 存数据
                _smallDic=[[NSMutableDictionary alloc] init];
                [_smallDic setObject:_dataArr[_currentPage][@"id"] forKey:@"id"];
                [_smallDic setObject:[NSString stringWithFormat:@"%ld",_chooseInteger] forKey:@"answer"];
                if (_currentPage+1>_resultArr.count)
                {
                    [_resultArr addObject:_smallDic];
                }
                else
                {
                    [_resultArr replaceObjectAtIndex:_currentPage withObject:_smallDic];
                }
            }
            else
            {
                [_yesBtn setImage:[UIImage imageNamed:@"ic_unchecked"] forState:UIControlStateNormal];
                _yesBtn.selected=NO;
            }
        }
            break;
        case 2://否---1
        {
            if (_noBtn.selected==NO)
            {
                if (_yesBtn.selected==NO)
                {
                    [_noBtn setImage:[UIImage imageNamed:@"ic_checked"] forState:UIControlStateNormal];
                }
                else
                {
                    [_noBtn setImage:[UIImage imageNamed:@"ic_checked"] forState:UIControlStateNormal];
                    [_yesBtn setImage:[UIImage imageNamed:@"ic_unchecked"] forState:UIControlStateNormal];
                    _yesBtn.selected=NO;
                }
                _noBtn.selected=YES;
                _chooseInteger=1;
                // 存数据
                _smallDic=[[NSMutableDictionary alloc] init];
                [_smallDic setObject:_dataArr[_currentPage][@"id"] forKey:@"id"];
                [_smallDic setObject:[NSString stringWithFormat:@"%ld",_chooseInteger] forKey:@"answer"];
                if (_currentPage+1>_resultArr.count)
                {
                    [_resultArr addObject:_smallDic];
                }
                else
                {
                    [_resultArr replaceObjectAtIndex:_currentPage withObject:_smallDic];
                }
            }
            else
            {
                [_noBtn setImage:[UIImage imageNamed:@"ic_unchecked"] forState:UIControlStateNormal];
                _noBtn.selected=NO;
            }
        }
            break;
        case 3://上一步
        {
            if (_currentPage>0)
            {
                _currentPage--;
            }
            NSInteger frontIntrger= [_resultArr[_currentPage][@"answer"] integerValue];
            [_headerView removeFromSuperview];
            [_chooseView removeFromSuperview];
            [self createHeaderView];
            [self createChooseView];
            if (frontIntrger==0)//是
            {
                _yesBtn.selected=YES;
                _noBtn.selected=NO;
                [_yesBtn setImage:[UIImage imageNamed:@"ic_checked"] forState:UIControlStateNormal];
                [_noBtn setImage:[UIImage imageNamed:@"ic_unchecked"] forState:UIControlStateNormal];
            }
            else//否
            {
                _yesBtn.selected=NO;
                _noBtn.selected=YES;
                [_yesBtn setImage:[UIImage imageNamed:@"ic_unchecked"] forState:UIControlStateNormal];
                [_noBtn setImage:[UIImage imageNamed:@"ic_checked"] forState:UIControlStateNormal];
            }
        }
            break;
        case 4://下一步
        {
            if (_currentPage+1<_resultArr.count)//判断下一页的页码在不在数组中
            {
                NSInteger nextInteger= [_resultArr[_currentPage+1][@"answer"] integerValue];
                _currentPage++;
                [_headerView removeFromSuperview];
                [_chooseView removeFromSuperview];
                [self createHeaderView];
                [self createChooseView];
                if (nextInteger==0)//是
                {
                    _yesBtn.selected=YES;
                    _noBtn.selected=NO;
                    [_yesBtn setImage:[UIImage imageNamed:@"ic_checked"] forState:UIControlStateNormal];
                    [_noBtn setImage:[UIImage imageNamed:@"ic_unchecked"] forState:UIControlStateNormal];
                }
                else//否
                {
                    _yesBtn.selected=NO;
                    _noBtn.selected=YES;
                    [_yesBtn setImage:[UIImage imageNamed:@"ic_unchecked"] forState:UIControlStateNormal];
                    [_noBtn setImage:[UIImage imageNamed:@"ic_checked"] forState:UIControlStateNormal];
                }
            }
            else
            {
                if (_yesBtn.selected==YES||_noBtn.selected==YES)
                {
                    if (_currentPage<_dataArr.count-1)
                    {
                        _currentPage++;
                    }
                    [_headerView removeFromSuperview];
                    [_chooseView removeFromSuperview];
                    [self createHeaderView];
                    [self createChooseView];
                }
                else
                {
                    UIAlertController*alert=[UIAlertController alertControllerWithTitle:@"" message:@"请做出选择" preferredStyle:UIAlertControllerStyleAlert];
                    [self presentViewController:alert animated:true completion:nil];
                    _jishiTime=1;
                    _myTimer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(jishiTimer) userInfo:nil repeats:YES];
                }
            }
        }
            break;
        case 5://提交
        {
            if (_yesBtn.selected==NO&&_noBtn.selected==NO)
            {
                UIAlertController*alert=[UIAlertController alertControllerWithTitle:@"" message:@"请做出选择" preferredStyle:UIAlertControllerStyleAlert];
                [self presentViewController:alert animated:true completion:nil];
                _jishiTime=1;
                _myTimer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(jishiTimer) userInfo:nil repeats:YES];
            }
            else
            {
                [HttpManager requestTJCPWithcompletionBlock:^(NSDictionary *dic)
                {
                    zzcpResultVC*zzcpResult=[[zzcpResultVC alloc] init];
                    zzcpResult.detailDic=dic;
                    zzcpResult.leftLabelTitle=_leftLabelTitle;
                    [self.navigationController pushViewController:zzcpResult animated:YES];
                } integer:0 listArr:_resultArr];
            }
        }
            break;
        default:
            break;
    }
}
#pragma mark- 定时器计时方法
- (void)jishiTimer
{
    _jishiTime--;
    if (_jishiTime==0)
    {
        [self dismissViewControllerAnimated:NO completion:nil];
        [_myTimer invalidate];
    }
}
- (void)createHeaderView
{
    _viewHeight=[_dataArr[_currentPage][@"question"] heightWithWidth:SCREEN_WIDTH-(18.0/750*SCREEN_WIDTH+30.0/750*SCREEN_WIDTH) font:30/2]+50.0/1334*SCREEN_HEIGHT;
    _headerView=[[UIView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height, SCREEN_WIDTH, _viewHeight+20.0/1334*SCREEN_HEIGHT)];
    _headerView.backgroundColor=[UIColor clearColor];
//    UIImageView*leftImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 15.0/1334*SCREEN_HEIGHT, 50.0/750*SCREEN_WIDTH, 50.0/1334*SCREEN_HEIGHT)];
//    leftImage.image=[UIImage imageNamed:[NSString stringWithFormat:@"ic_test.9"]];
    _leftHeaderViewBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _leftHeaderViewBtn.frame=CGRectMake(0, 15.0/1334*SCREEN_HEIGHT, 60.0/750*SCREEN_WIDTH, 50.0/1334*SCREEN_HEIGHT);
    if (_dataArr==nil)
    {
        _leftHeaderViewBtn.frame=CGRectMake(0, 0, 60.0/750*SCREEN_WIDTH, 50.0/1334*SCREEN_HEIGHT);
    }
    _leftHeaderViewBtn.userInteractionEnabled=NO;
    [_leftHeaderViewBtn setBackgroundImage:[UIImage imageNamed:@"ic_test.9"] forState:UIControlStateNormal];
    [_leftHeaderViewBtn setTitle:[NSString stringWithFormat:@"%ld",_currentPage+1] forState:UIControlStateNormal];
    [_headerView addSubview:_leftHeaderViewBtn];
    _rightLabel=[[UILabel alloc] initWithFrame:CGRectMake(_leftHeaderViewBtn.frame.size.width+10.0/750*SCREEN_WIDTH, 0, SCREEN_WIDTH-(_leftHeaderViewBtn.frame.size.width+30.0/750*SCREEN_WIDTH), _viewHeight)];
    _rightLabel.text=_dataArr[_currentPage][@"question"];
    _rightLabel.textColor=[UIColor grayColor];
    _rightLabel.font=[UIFont systemFontOfSize:30/2];
    _rightLabel.numberOfLines=0;
    [_headerView addSubview:_rightLabel];
    UIImageView *headerBottomView=[[UIImageView alloc] initWithFrame:CGRectMake(0, _viewHeight, SCREEN_WIDTH, 20.0/1334*SCREEN_HEIGHT)];
    headerBottomView.image=[UIImage imageNamed:@"ic_divider"];
    [_headerView addSubview:headerBottomView];
    [self.view addSubview:_headerView];
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
