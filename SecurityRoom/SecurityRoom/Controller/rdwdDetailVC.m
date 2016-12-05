//
//  rdwdDetailVC.m
//  SecurityRoom
//
//  Created by zte_gdy on 16/4/1.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "rdwdDetailVC.h"
#import "rdwdCell.h"
#import "rdwdContentVC.h"

@interface rdwdDetailVC ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)UIImageView*barView;
@property(nonatomic,strong)UIButton*leftBtn;
@property(nonatomic,strong)UILabel*leftLabel;
@property(nonatomic,strong)UIScrollView*myScrollView;
@property(nonatomic,strong)UITableView*myTableView1;
@property(nonatomic,strong)UITableView*myTableView2;
@property(nonatomic,strong)UITableView*myTableView3;
@property(nonatomic,strong)UITableView*myTableView4;
@property(nonatomic,strong)UIButton*bottomBtnLeft1;
@property(nonatomic,strong)UIButton*bottomBtnLeft2;
@property(nonatomic,strong)UIButton*bottomBtnLeft3;
@property(nonatomic,strong)UIButton*bottomBtnLeft4;
@property(nonatomic,strong)UIButton*bottomBtnLeft5;
@property(nonatomic,strong)NSMutableArray*dataArr;
@property(nonatomic,strong)NSMutableArray*imageDataArr;
@property(nonatomic,assign)NSInteger currentNumber;
@end

@implementation rdwdDetailVC
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
    bgImage.image=[UIImage imageNamed:@"bg_question_list"];
    [self.view addSubview:bgImage];
    _dataArr=[[NSMutableArray alloc] init];
    _dataArr=_detailDic[@"detail"][@"list"];
    [self createScrollView];
    [self createTableView];
    [self createBottomView];
    _currentNumber=1;
}
- (void)createBottomView
{
    UIView*bottomView=[[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-80.0/1334*SCREEN_HEIGHT, SCREEN_HEIGHT, 80.0/1334*SCREEN_HEIGHT)];
    bottomView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:bottomView];
    float space=12.0/750*SCREEN_WIDTH/4;
    float btnW=(SCREEN_WIDTH-12.0/750*SCREEN_WIDTH)/5;
    float btnH=bottomView.frame.size.height;
    _bottomBtnLeft1=[UIButton buttonWithType:UIButtonTypeCustom];
    _bottomBtnLeft1.frame=CGRectMake(0, 0, btnW, btnH);
    _bottomBtnLeft1.backgroundColor=[UIColor whiteColor];
    [_bottomBtnLeft1 setTitle:@"首页" forState:UIControlStateNormal];
    [_bottomBtnLeft1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _bottomBtnLeft1.titleLabel.font=[UIFont systemFontOfSize:30/2];
    [_bottomBtnLeft1 addTarget:self action:@selector(bottomAction:) forControlEvents:UIControlEventTouchUpInside];
    _bottomBtnLeft1.tag=1;
    [bottomView addSubview:_bottomBtnLeft1];
    
    _bottomBtnLeft2=[UIButton buttonWithType:UIButtonTypeCustom];
    _bottomBtnLeft2.frame=CGRectMake(btnW+space, 0, btnW, btnH);
    _bottomBtnLeft2.backgroundColor=[UIColor whiteColor];
    [_bottomBtnLeft2 setTitle:@"上一页" forState:UIControlStateNormal];
    [_bottomBtnLeft2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _bottomBtnLeft2.titleLabel.font=[UIFont systemFontOfSize:30/2];
     [_bottomBtnLeft2 addTarget:self action:@selector(bottomAction:) forControlEvents:UIControlEventTouchUpInside];
    _bottomBtnLeft2.tag=2;
    [bottomView addSubview:_bottomBtnLeft2];
    
    _bottomBtnLeft3=[UIButton buttonWithType:UIButtonTypeCustom];
    _bottomBtnLeft3.frame=CGRectMake(_bottomBtnLeft2.frame.origin.x+_bottomBtnLeft2.frame.size.width+space, 0, btnW, btnH);
    _bottomBtnLeft3.backgroundColor=[UIColor whiteColor];
    NSInteger number=ceilf(_dataArr.count/15.0);
    [_bottomBtnLeft3 setTitle:[NSString stringWithFormat:@"1/%ld",(long)number] forState:UIControlStateNormal];
    [_bottomBtnLeft3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _bottomBtnLeft3.titleLabel.textColor=[UIColor grayColor];
    [bottomView addSubview:_bottomBtnLeft3];
    
    _bottomBtnLeft4=[UIButton buttonWithType:UIButtonTypeCustom];
    _bottomBtnLeft4.frame=CGRectMake(_bottomBtnLeft3.frame.origin.x+_bottomBtnLeft3.frame.size.width+space, 0, btnW, btnH);
    _bottomBtnLeft4.backgroundColor=[UIColor whiteColor];
    [_bottomBtnLeft4 setTitle:@"下一页" forState:UIControlStateNormal];
    [_bottomBtnLeft4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _bottomBtnLeft4.titleLabel.font=[UIFont systemFontOfSize:30/2];
     [_bottomBtnLeft4 addTarget:self action:@selector(bottomAction:) forControlEvents:UIControlEventTouchUpInside];
    _bottomBtnLeft4.tag=4;
    [bottomView addSubview:_bottomBtnLeft4];
    
    _bottomBtnLeft5=[UIButton buttonWithType:UIButtonTypeCustom];
    _bottomBtnLeft5.frame=CGRectMake(_bottomBtnLeft4.frame.origin.x+_bottomBtnLeft4.frame.size.width+space, 0, btnW, btnH);
    _bottomBtnLeft5.backgroundColor=[UIColor whiteColor];
    [_bottomBtnLeft5 setTitle:@"末页" forState:UIControlStateNormal];
    [_bottomBtnLeft5 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _bottomBtnLeft5.titleLabel.font=[UIFont systemFontOfSize:30/2];
     [_bottomBtnLeft5 addTarget:self action:@selector(bottomAction:) forControlEvents:UIControlEventTouchUpInside];
    _bottomBtnLeft5.tag=5;
    [bottomView addSubview:_bottomBtnLeft5];
    if (number==0||number==1)
    {
        number=1;
        _bottomBtnLeft1.userInteractionEnabled=NO;
        _bottomBtnLeft2.userInteractionEnabled=NO;
        _bottomBtnLeft3.userInteractionEnabled=NO;
        _bottomBtnLeft4.userInteractionEnabled=NO;
        _bottomBtnLeft5.userInteractionEnabled=NO;
        [_bottomBtnLeft3 setTitle:[NSString stringWithFormat:@"1/%ld",(long)number] forState:UIControlStateNormal];
    }
}
- (void)createScrollView
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    _myScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0,  self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-(self.navigationController.navigationBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height+80.0/1334*SCREEN_HEIGHT))];
    _myScrollView.contentSize=CGSizeMake(SCREEN_WIDTH*ceilf(_dataArr.count/15.0), 0);
    _myScrollView.pagingEnabled=YES;
    _myScrollView.scrollEnabled=YES;
    _myScrollView.showsVerticalScrollIndicator=NO;
    _myScrollView.backgroundColor=[UIColor clearColor];
    _myScrollView.showsHorizontalScrollIndicator=NO;//水平
    _myScrollView.delegate=self;
    [self.view addSubview:_myScrollView];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger i = _myScrollView.contentOffset.x / SCREEN_WIDTH;
    NSInteger number=ceilf(_dataArr.count/15.0);
    [_bottomBtnLeft3 setTitle:[NSString stringWithFormat:@"%ld/%ld",i+1,(long)number] forState:UIControlStateNormal];
    _currentNumber=i+1;
}
- (void)bottomAction:(UIButton*)sender
{
    NSInteger x= _myScrollView.contentOffset.x/SCREEN_WIDTH;
    NSInteger number=ceilf(_dataArr.count/15.0);
    switch (sender.tag)
    {
        case 1:
        {
            _myScrollView.contentOffset=CGPointMake(0, 0);
            [_bottomBtnLeft3 setTitle:[NSString stringWithFormat:@"1/%ld",(long)number] forState:UIControlStateNormal];
            _currentNumber=1;
        }
            break;
        case 2:
        {
            if (x!=0)
            {
                _myScrollView.contentOffset=CGPointMake(SCREEN_WIDTH*(x-1), 0);
                [_bottomBtnLeft3 setTitle:[NSString stringWithFormat:@"%ld/%ld",x,(long)number] forState:UIControlStateNormal];
                _currentNumber=x;
            }
        }
            break;
        case 4:
        {
            if (x+1!=number)
            {
                _myScrollView.contentOffset=CGPointMake(SCREEN_WIDTH*(x+1), 0);
                [_bottomBtnLeft3 setTitle:[NSString stringWithFormat:@"%ld/%ld",x+2,(long)number] forState:UIControlStateNormal];
                _currentNumber=x+2;
            }
        }
            break;
        case 5:
        {
            _myScrollView.contentOffset=CGPointMake(SCREEN_WIDTH*(number-1), 0);
            [_bottomBtnLeft3 setTitle:[NSString stringWithFormat:@"%ld/%ld",(long)number,(long)number] forState:UIControlStateNormal];
            _currentNumber=number;
        }
            break;
        default:
            break;
    }
    [_myScrollView reloadInputViews];
}
- (void)createTableView
{
    if (_dataArr.count<16)
    {
        _myTableView1=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-( _barView.frame.origin.y+_barView.frame.size.height+120.0/1334*SCREEN_HEIGHT)) style:UITableViewStylePlain];
        _myTableView1.delegate=self;
        _myTableView1.dataSource=self;
        _myTableView1.backgroundColor=[UIColor clearColor];
        _myTableView1.separatorColor=[UIColor lightGrayColor];
        _myTableView1.separatorStyle=UITableViewCellSeparatorStyleNone;
        _myTableView1.showsVerticalScrollIndicator=NO;
        [_myScrollView addSubview:_myTableView1];
        [_myTableView1 registerNib:[UINib nibWithNibName:@"rdwdCell" bundle:nil] forCellReuseIdentifier:@"rdwdCell"];
        UIView*footerView1=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        footerView1.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
        _myTableView1.tableFooterView=footerView1;
    }
   else if (_dataArr.count>15&&_dataArr.count<31)
   {
       _myTableView1=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-( _barView.frame.origin.y+_barView.frame.size.height+120.0/1334*SCREEN_HEIGHT)) style:UITableViewStylePlain];
       _myTableView1.delegate=self;
       _myTableView1.dataSource=self;
       _myTableView1.backgroundColor=[UIColor clearColor];
       _myTableView1.separatorStyle=UITableViewCellSeparatorStyleNone;
       _myTableView1.showsVerticalScrollIndicator=NO;
       [_myScrollView addSubview:_myTableView1];
       UIView*footerView1=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
       footerView1.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
       _myTableView1.tableFooterView=footerView1;
       
       _myTableView2=[[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-( _barView.frame.origin.y+_barView.frame.size.height+120.0/1334*SCREEN_HEIGHT)) style:UITableViewStylePlain];
       _myTableView2.delegate=self;
       _myTableView2.dataSource=self;
       _myTableView2.backgroundColor=[UIColor clearColor];
       _myTableView2.separatorStyle=UITableViewCellSeparatorStyleNone;
       _myTableView2.showsVerticalScrollIndicator=NO;

       [_myScrollView addSubview:_myTableView2];
       [_myTableView1 registerNib:[UINib nibWithNibName:@"rdwdCell" bundle:nil] forCellReuseIdentifier:@"rdwdCell"];
       [_myTableView2 registerNib:[UINib nibWithNibName:@"rdwdCell" bundle:nil] forCellReuseIdentifier:@"rdwdCell"];
       UIView*footerView2=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
       footerView2.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
       _myTableView2.tableFooterView=footerView2;
   }
   else if (_dataArr.count>30&&_dataArr.count<46)
   {
       _myTableView1=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-( _barView.frame.origin.y+_barView.frame.size.height+120.0/1334*SCREEN_HEIGHT)) style:UITableViewStylePlain];
       _myTableView1.delegate=self;
       _myTableView1.dataSource=self;
       _myTableView1.backgroundColor=[UIColor clearColor];
       _myTableView1.separatorStyle=UITableViewCellSeparatorStyleNone;
       UIView*footerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
       footerView.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
       _myTableView1.tableFooterView=footerView;
       _myTableView1.showsVerticalScrollIndicator=NO;
       [_myScrollView addSubview:_myTableView1];
       UIView*footerView1=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
       footerView1.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
       _myTableView1.tableFooterView=footerView1;

       
       _myTableView2=[[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-( _barView.frame.origin.y+_barView.frame.size.height+120.0/1334*SCREEN_HEIGHT)) style:UITableViewStylePlain];
       _myTableView2.delegate=self;
       _myTableView2.dataSource=self;
       _myTableView2.backgroundColor=[UIColor clearColor];
       _myTableView2.showsVerticalScrollIndicator=NO;
       _myTableView2.separatorStyle=UITableViewCellSeparatorStyleNone;
       [_myScrollView addSubview:_myTableView2];
       UIView*footerView2=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
       footerView2.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
       _myTableView2.tableFooterView=footerView2;
       
       
       _myTableView3=[[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT-( _barView.frame.origin.y+_barView.frame.size.height+120.0/1334*SCREEN_HEIGHT)) style:UITableViewStylePlain];
       _myTableView3.delegate=self;
       _myTableView3.dataSource=self;
       _myTableView3.backgroundColor=[UIColor clearColor];
       _myTableView3.separatorStyle=UITableViewCellSeparatorStyleNone;
       _myTableView3.showsVerticalScrollIndicator=NO;
       [_myScrollView addSubview:_myTableView3];
       UIView*footerView3=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
       footerView3.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
       _myTableView2.tableFooterView=footerView3;
       [_myTableView1 registerNib:[UINib nibWithNibName:@"rdwdCell" bundle:nil] forCellReuseIdentifier:@"rdwdCell"];
       [_myTableView2 registerNib:[UINib nibWithNibName:@"rdwdCell" bundle:nil] forCellReuseIdentifier:@"rdwdCell"];
       [_myTableView3 registerNib:[UINib nibWithNibName:@"rdwdCell" bundle:nil] forCellReuseIdentifier:@"rdwdCell"];
   }
   else
   {
       _myTableView1=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-( _barView.frame.origin.y+_barView.frame.size.height+120.0/1334*SCREEN_HEIGHT)) style:UITableViewStylePlain];
       _myTableView1.delegate=self;
       _myTableView1.dataSource=self;
       _myTableView1.backgroundColor=[UIColor clearColor];
       _myTableView1.separatorStyle=UITableViewCellSeparatorStyleNone;
       _myTableView1.showsVerticalScrollIndicator=NO;
       [_myScrollView addSubview:_myTableView1];
       UIView*footerView1=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
       footerView1.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
       _myTableView1.tableFooterView=footerView1;
       
       _myTableView2=[[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-( _barView.frame.origin.y+_barView.frame.size.height+120.0/1334*SCREEN_HEIGHT)) style:UITableViewStylePlain];
       _myTableView2.delegate=self;
       _myTableView2.dataSource=self;
       _myTableView2.backgroundColor=[UIColor clearColor];
       _myTableView2.separatorStyle=UITableViewCellSeparatorStyleNone;
       _myTableView2.showsVerticalScrollIndicator=NO;
       [_myScrollView addSubview:_myTableView2];
       UIView*footerView2=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
       footerView2.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
       _myTableView2.tableFooterView=footerView2;
       
       _myTableView3=[[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT-( _barView.frame.origin.y+_barView.frame.size.height+120.0/1334*SCREEN_HEIGHT)) style:UITableViewStylePlain];
       _myTableView3.delegate=self;
       _myTableView3.dataSource=self;
       _myTableView3.backgroundColor=[UIColor clearColor];
       _myTableView3.separatorStyle=UITableViewCellSeparatorStyleNone;
       _myTableView3.showsVerticalScrollIndicator=NO;
       [_myScrollView addSubview:_myTableView3];
       UIView*footerView3=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
       footerView3.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
       _myTableView2.tableFooterView=footerView3;
       
       
       _myTableView4=[[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*3, 0, SCREEN_WIDTH, SCREEN_HEIGHT-( _barView.frame.origin.y+_barView.frame.size.height+120.0/1334*SCREEN_HEIGHT)) style:UITableViewStylePlain];
       _myTableView4.delegate=self;
       _myTableView4.dataSource=self;
       _myTableView4.showsVerticalScrollIndicator=NO;
       _myTableView4.backgroundColor=[UIColor clearColor];
       _myTableView4.separatorStyle=UITableViewCellSeparatorStyleNone;
       [_myScrollView addSubview:_myTableView4];
       UIView*footerView4=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
       footerView4.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
       _myTableView2.tableFooterView=footerView4;
       [_myTableView1 registerNib:[UINib nibWithNibName:@"rdwdCell" bundle:nil] forCellReuseIdentifier:@"rdwdCell"];
       [_myTableView2 registerNib:[UINib nibWithNibName:@"rdwdCell" bundle:nil] forCellReuseIdentifier:@"rdwdCell"];
       [_myTableView3 registerNib:[UINib nibWithNibName:@"rdwdCell" bundle:nil] forCellReuseIdentifier:@"rdwdCell"];
       [_myTableView4 registerNib:[UINib nibWithNibName:@"rdwdCell" bundle:nil] forCellReuseIdentifier:@"rdwdCell"];
   }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    rdwdContentVC*rdwdContent=[[rdwdContentVC alloc] init];
    rdwdContent.sectionHeaderViewTitle= _dataArr[indexPath.row+15*(_currentNumber-1)][@"question"];
    rdwdContent.leftLabelTitle=_frontLeftLabelTitle;
    rdwdContent.cellContent= _dataArr[indexPath.row+15*(_currentNumber-1)][@"answer"];
    [self.navigationController pushViewController:rdwdContent animated:YES];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    rdwdCell*cell=[tableView dequeueReusableCellWithIdentifier:@"rdwdCell"];
    cell.backgroundColor=[UIColor clearColor];
    [cell.cellBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cell.cellBtn.titleLabel.font=[UIFont systemFontOfSize:30/2];
    cell.bottomLineView.backgroundColor=[UIColor lightGrayColor];
    cell.contentL.textColor=[UIColor lightGrayColor];
    cell.contentL.font=[UIFont systemFontOfSize:30/2];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    UIView*bottomView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    bottomView.backgroundColor=[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    [cell addSubview:bottomView];
    NSInteger a=indexPath.row+1;
    if (a>5)
    {
        a=(indexPath.row+1)-5*floor((indexPath.row+1)/5);
        if (a==0)
        {
            a=5;
        }
    }
    if ([tableView isEqual:_myTableView1])
    {
        [cell.cellBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"ic_item_0%ld",a]] forState:UIControlStateNormal];
        [cell.cellBtn setTitle:[NSString stringWithFormat:@"%ld",indexPath.row+1] forState:UIControlStateNormal];
        cell.contentL.text=_dataArr[indexPath.row][@"question"];
    }
    else if ([tableView isEqual:_myTableView2])
    {
        [cell.cellBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"ic_item_0%ld",a]] forState:UIControlStateNormal];
        [cell.cellBtn setTitle:[NSString stringWithFormat:@"%ld",indexPath.row+1+15] forState:UIControlStateNormal];
        cell.contentL.text=_dataArr[indexPath.row+15][@"question"];
    }
    else if ([tableView isEqual:_myTableView3])
    {
        [cell.cellBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"ic_item_0%ld",a]] forState:UIControlStateNormal];
        [cell.cellBtn setTitle:[NSString stringWithFormat:@"%ld",indexPath.row+1+15*2] forState:UIControlStateNormal];
        cell.contentL.text=_dataArr[indexPath.row+15*2][@"question"];
    }
    else
    {
        [cell.cellBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"ic_item_0%ld",a]] forState:UIControlStateNormal];
        [cell.cellBtn setTitle:[NSString stringWithFormat:@"%ld",indexPath.row+1+15*3] forState:UIControlStateNormal];
        cell.contentL.text=_dataArr[indexPath.row+15*3][@"question"];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0/1334*SCREEN_HEIGHT;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_dataArr.count<16)
    {
        return _dataArr.count;
    }
    else if (_dataArr.count>15&&_dataArr.count<31)
    {
        if ([tableView isEqual:_myTableView1])
        {
            return 15;
        }
        else
        {
            return _dataArr.count-15;
        }
    }
    else if (_dataArr.count>30&&_dataArr.count<46)
    {
        if ([tableView isEqual:_myTableView1]||[tableView isEqual:_myTableView2])
        {
            return 15;
        }
        else
        {
            return _dataArr.count-15*2;
        }
    }
    else
    {
        if ([tableView isEqual:_myTableView1]||[tableView isEqual:_myTableView2]||[tableView isEqual:_myTableView3])
        {
            return 15;
        }
        else
        {
            return _dataArr.count-15*3;
        }
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
