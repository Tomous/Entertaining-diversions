//
//  ViewController.m
//  跑马灯
//
//  Created by 许大成 on 16/8/3.
//  Copyright © 2016年 许大成. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong) NSTimer* timer;// 定义定时器
@property(nonatomic,weak) UILabel *customLab;

@property(nonatomic,strong) UIView *viewAnima; //装 滚动视图的容器

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    //*******添加中间标题
    [self addMiddleTitleView];

    // 启动NSTimer定时器来改变UIImageView的位置
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                  target:self selector:@selector(changePos)
                                                userInfo:nil repeats:YES];

}

-(void) addMiddleTitleView
{
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 100, 40)];
    leftView.backgroundColor = [UIColor redColor];
    [self.view addSubview:leftView];
    
    //定义视图大小
    UIView *viewAnima = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftView.frame), 100, 200, 40)];
    viewAnima.backgroundColor = [UIColor  yellowColor];
    self.viewAnima = viewAnima;
    [self.view addSubview:viewAnima];
    
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(viewAnima.frame), 100, self.view.frame.size.width - leftView.frame.size.width - viewAnima.frame.size.width, 40)];
    rightView.backgroundColor = [UIColor redColor];
    [self.view addSubview:rightView];
    
    
    CGFloat customLabY = (self.viewAnima.frame.size.height - 30)/2;
    UILabel *customLab = [[UILabel alloc] init];
    customLab.backgroundColor = [UIColor clearColor];
    customLab.frame = CGRectMake(self.viewAnima.frame.size.width, customLabY, 250, 30);
    [customLab setTextColor:[UIColor redColor]];
    [customLab setText:@"过年啦！触碰屏幕，有惊奇哦！"];
    customLab.font = [UIFont boldSystemFontOfSize:17];
    self.customLab = customLab;
    //添加视图
    [self.viewAnima addSubview:customLab];
    
    
}
//其实蝴蝶的整个移动都是————靠iv.center来去设置的
- (void) changePos
{
    CGPoint curPos = self.customLab.center;
    
    // 当curPos的x坐标已经超过了屏幕的宽度
    if(curPos.x < -100)
    {
        CGFloat jianJu = self.customLab.frame.size.width/2;
        // 控制蝴蝶再次从屏幕左侧开始移动
        self.customLab.center = CGPointMake(self.viewAnima.frame.size.width + jianJu, 20);
    }
    else
    {
        // 通过修改iv的center属性来改变iv控件的位置
        self.customLab.center = CGPointMake(curPos.x - 4, 20);
    }
    //其实蝴蝶的整个移动都是————靠iv.center来去设置的
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
