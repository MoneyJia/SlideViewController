//
//  InternalPageViewController.m
//  PhotoAlbum
//
//  Created by 朱前进 on 16/8/16.
//  Copyright © 2016年 sancaigongsi. All rights reserved.
//

#import "InternalPageViewController.h"
#import "Adaptation.h"
#import "UILabel+extension.h"
#import "UIViewExt.h"
#import "NSObject+method.h"

//viewcontroller
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.height     //屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.width    //屏幕宽度

@interface InternalPageViewController ()
{
    BOOL isGo;//确定是否移动
}
@property (nonatomic,strong) UIScrollView *bacScrollView;
@property (nonatomic,strong) UIImageView *mirrorImageView;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) CGPoint longPressPoint;//长按拖动的point
@property (nonatomic,strong) NSMutableArray *filePathArr;//appuser数组
@property (nonatomic,strong) NSMutableArray *pictureModelArr;//旧的数据
@property (nonatomic,strong) NSTimer *pressTimer;//定时器

@end

static CGFloat oneTime = 0.25;
@implementation InternalPageViewController

- (NSMutableArray *)filePathArr
{
    if (_filePathArr == nil) {
        _filePathArr = [[NSMutableArray alloc] init];
    }
    return _filePathArr;
}
- (NSMutableArray *)pictureModelArr
{
    if (_pictureModelArr == nil) {
        _pictureModelArr = [[NSMutableArray alloc] init];
    }
    return _pictureModelArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.
    self.view.backgroundColor = [UIColor lightGrayColor];
    //2.导航栏
    [self createNav];
    //3.图片
    [self createSubViews];
    //4.定时器
    self.pressTimer = [NSTimer scheduledTimerWithTimeInterval:oneTime target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    //关闭定时器
    [self.timer setFireDate:[NSDate distantFuture]];
    
}

//定时器
- (void)timerAction:(NSTimer *)timer
{
    [self function];
}

//导航栏
- (void)createNav
{
    UIView *bacView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    bacView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    [self.view addSubview:bacView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = [Adaptation initWithNewFrame:CGRectMake(0, 0, 45, 50)];
    [backButton addTarget:self action:@selector(backViewController) forControlEvents:UIControlEventTouchUpInside];
    [bacView addSubview:backButton];
    
    
    UIImageView *bacIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"白色横版箭头"]];
    bacIm.userInteractionEnabled = NO;
    bacIm.frame = [Adaptation initWithNewFrame:CGRectMake(20, 15, 12, 22)];
    [backButton addSubview:bacIm];
    
    //title
    UILabel *titleLable = [UILabel labelWithFram:CGRectMake(0, 0, 400, 50) font:20 tintColor:[UIColor whiteColor] andTitle:@"页面排序(长按单页并拖动调整顺序）" bold:1 textAlignment:1 isBorder:0 cornerRadius:0];
    titleLable.left = (SCREEN_WIDTH-titleLable.width)/2.0;
    [bacView addSubview:titleLable];
    
    
    //OK按钮
    UIButton *oKButton = [UIButton buttonWithType:UIButtonTypeSystem];
    oKButton.frame = [Adaptation initWithNewFrame:CGRectMake(667-60, 5, 40, 40)];
    //        oKButton.backgroundColor = [UIColor greenColor];
    [oKButton addTarget:self action:@selector(OkViewController) forControlEvents:UIControlEventTouchUpInside];
    [bacView addSubview:oKButton];
    
    UIImage *duigou = [UIImage imageNamed:@"白色横版对勾"];
    UIImageView *duigouImageV = [[UIImageView alloc] initWithFrame:[Adaptation initWithNewFrame:CGRectMake(10, 15, 20, 15)]];
    duigouImageV.image = duigou;
    duigouImageV.userInteractionEnabled = NO;
    [oKButton addSubview:duigouImageV];
    
}

//内页
- (void)createSubViews
{
    //个数
    int num = 24;
    
    //滚动试图
    self.bacScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT-50)];
//    self.bacScrollView.myDelegte = self;
    self.bacScrollView.backgroundColor = [UIColor clearColor];
    self.bacScrollView.showsVerticalScrollIndicator = NO;
    self.bacScrollView.showsHorizontalScrollIndicator = NO;
    int index = 0;
    if (num%4==0) {
        index = num/4;
    }else{
        index = num/4+1;
    }
    self.bacScrollView.contentSize = CGSizeMake(SCREEN_WIDTH,index*([Adaptation initWithNewCGfloatY:144]+40)+20);
    [self.view addSubview:self.bacScrollView];
    
    //image
    for (int i=0; i<num; i++) {

        int top = i/4;
        int left = i%4;
        int leftWidth = 0;
        
        if (i%4 == 0||i%4 == 1) {
            leftWidth = 0;
        }else{
            leftWidth = 30;
        }
        
        
        UIImageView *bacIm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"thumbnail%d.JPG",i]]];
        bacIm.tag = 100+i;
//        bacIm.numIndex = i;
//        bacIm.myDelegte = self;
        bacIm.userInteractionEnabled = YES;
        bacIm.frame = [Adaptation initWithNewFrame:CGRectMake(30+left*144+leftWidth, 12+top*(144+40), 144, 144)];
        [self.bacScrollView addSubview:bacIm];
        
        UIView *grayView = [UIView viewWithFram:CGRectMake(0, 0, bacIm.width, bacIm.height) cornerRadius:0 bacgoudColor:0];
        grayView.tag = 1000+i;
        grayView.hidden = YES;
        grayView.alpha = 0.5;
        grayView.backgroundColor = [UIColor lightGrayColor];
        [bacIm addSubview:grayView];
        
        //长按
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longResss:)];
        [bacIm addGestureRecognizer:longPress];
        
        UILabel *titleLable = [UILabel labelWithFram:CGRectMake(bacIm.left, bacIm.bottom+5, bacIm.width, 15) font:15 tintColor:[UIColor blackColor] andTitle:[NSString stringWithFormat:@"%d",i+1] bold:1 textAlignment:1 isBorder:0 cornerRadius:0];
        titleLable.backgroundColor = [UIColor clearColor];
        [self.bacScrollView addSubview:titleLable];
        
        [self.filePathArr addObject:[NSString stringWithFormat:@"thumbnail%d.JPG",i]];
    }
    
    //镜像
    self.mirrorImageView = [[UIImageView alloc] init];
    self.mirrorImageView.userInteractionEnabled = NO;
    self.mirrorImageView.hidden = YES;
    self.mirrorImageView.frame = [Adaptation initWithNewFrame:CGRectMake(0, 0, 144-10, 144-10)];
    [self.view addSubview:self.mirrorImageView];
   
}


//返回
- (void)backViewController
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

//确定
- (void)OkViewController
{


}

#pragma mark -LongPress
- (void)longResss:(UILongPressGestureRecognizer *)longPress
{
    CGPoint point = [longPress locationInView:self.view];
    self.longPressPoint = point;
    NSLog(@"X:%f;Y:%f",point.x,point.y);
    NSLog(@"SCREEN_HEIGHT is %f",SCREEN_HEIGHT);
    NSLog(@"SCREEN_WIDTH is %f",SCREEN_WIDTH);

    if (longPress.state == UIGestureRecognizerStateBegan) {
//        NSLog(@"long pressTap state :begin");
        
        self.mirrorImageView.image = [UIImage imageNamed:[self.filePathArr objectAtIndex:(int)longPress.view.tag-100]];
        self.mirrorImageView.hidden = NO;
        self.mirrorImageView.center = point;

    }else if (longPress.state == UIGestureRecognizerStateEnded){
     
        self.mirrorImageView.hidden = YES;
        
        isGo = NO;//表示禁止 滚动
        
        //调用交换方法
        [self exchangeAppuseFilePath:(int)longPress.view.tag-100];

        //关闭定时器
        [self.timer setFireDate:[NSDate distantFuture]];
        
        
    }else {
//        NSLog(@"long pressTap state :end");
        self.mirrorImageView.center = point;

        //显示灰色背景
        [self ShowGrayBackground:point];
       
        //关闭定时器
        [self.timer setFireDate:[NSDate distantFuture]];
        
        //0.25秒后开启定时器
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(oneTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //开启定时器
            [self.timer setFireDate:[NSDate distantPast]];
        });
        
        if (point.y>SCREEN_WIDTH-50) {
     
            if (isGo == NO) {//开始动画
                
                isGo = YES;//禁止下一次调用
        
                [self function];//开始动画
                
            }else{
                //不进行任何操作
            }
           
            
        }else if (point.y<50+50){
      
            if (isGo == NO) {//开始动画
                
                isGo = YES;//禁止下一次调用
                
                [self function];//开始动画
                
            }else{
                //不进行任何操作
            }

        }else{
            
            isGo = NO;//表示禁止 滚动
            
            //不进行任何操作
        }
        
    }
}



//偏移量
- (void)function
{
    if (isGo==NO) {
        return;//不滚动
    }
    
    
    [UIView animateWithDuration:oneTime animations:^{
        
        CGFloat h = 0;
        if (self.longPressPoint.y>SCREEN_WIDTH-50) {//向下
            h = 50;
        }else if (self.longPressPoint.y<50+50){//向上
            h = -50;
        }
        
        CGPoint contentOffsetPoint = self.bacScrollView.contentOffset;
        
        //个数
        int num = 24;
        int index = 0;
        if (num%4==0) {
            index = num/4;
        }else{
            index = num/4+1;
        }
        
        
        CGFloat endH = 0;
        
        if (contentOffsetPoint.y+h<=0) {//向上最小为0
            endH = 0;
        }else if (contentOffsetPoint.y+h+self.bacScrollView.height>index*([Adaptation initWithNewCGfloatY:144]+40)+20){//向下最大为偏移量
            endH = index*([Adaptation initWithNewCGfloatY:144]+40)+20-self.bacScrollView.height;
        }else{
            endH = contentOffsetPoint.y+h;
        }
        
        self.bacScrollView.contentOffset = CGPointMake(0, endH);
        
        isGo = YES;
        
    } completion:^(BOOL finished) {
       
        //结束时赋值
        isGo = NO;
    }];
    
//    self.bacScrollView.contentOffset = CGPointMake(0, endH);
//    NSLog(@"endH is %f",endH);
    
    
}

//灰色背景显示
- (void)ShowGrayBackground:(CGPoint )point
{
    CGPoint newPoint = CGPointMake(point.x+self.bacScrollView.contentOffset.x, point.y+self.bacScrollView.contentOffset.y);
    
    //个数
    int num = 24;
    for (int i=0; i<num; i++) {
        
        UIImageView *bacIm = [self.bacScrollView viewWithTag:100+i];
        UIView *grayView = [bacIm viewWithTag:1000+i];
        
        
        BOOL isContent = CGRectContainsPoint(bacIm.frame, newPoint);
        
        if (isContent) {
            grayView.hidden = NO;
        }else{
            grayView.hidden = YES;
        }
    }

}

//本地数据交换
- (void)exchangeAppuseFilePath:(int)selectIndex
{
    //个数
    int num = 24;
    
    int numIndex=0;//找到相对用的显示的张数
    
    for (int i=0; i<num; i++) {
        
        UIImageView *bacIm = [self.bacScrollView viewWithTag:100+i];
        UIView *grayView = [bacIm viewWithTag:1000+i];
        
        //找到相对用的显示的张数
        if (grayView.hidden == NO) {
            
            grayView.hidden = YES;//变为隐藏
            numIndex = i;//记录下那张图片被选中
        }
    }
    
    //如果selectIndex 和numIndex 相同 或者 numIndex ＝ 0，则不变
    if (selectIndex != numIndex && numIndex != 0) {
        [self.filePathArr exchangeObjectAtIndex:selectIndex withObjectAtIndex:numIndex];
        
        //改变两个index上的
        UIImageView *selectImageV = [self.bacScrollView viewWithTag:100+selectIndex];
        selectImageV.image = [UIImage imageNamed:[self.filePathArr objectAtIndex:selectIndex]];
        
        UIImageView *numIndexImageV = [self.bacScrollView viewWithTag:100+numIndex];
        numIndexImageV.image = [UIImage imageNamed:[self.filePathArr objectAtIndex:numIndex]];
    }
    
}

#pragma mark -横屏
- (BOOL)shouldAutorotate
{
    return NO;
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeRight;
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
