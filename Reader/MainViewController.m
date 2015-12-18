//
//  MainViewController.m
//  Reader
//


#import "MainViewController.h"
#import "MyBook.h"
#import "MyData.h"
#import "MyReaderViewController.h"
#import "TheBottomAlertView.h"
#import "TheChannelViewController.h"

#define kScreenW    [UIScreen mainScreen].bounds.size.width

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *menuBtn;

@property (nonatomic, strong)NSArray *datas;

@property (nonatomic, strong)TheBottomAlertView *theView;

@end

@implementation MainViewController

NSString *str;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBar];
    [self setBookView];
}

#pragma mark - 设置导航栏
- (void)setNavigationBar
{
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航"] forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"iconfont-caidan"] style:UIBarButtonItemStylePlain target:self action:nil];
    leftBarBtnItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem =leftBarBtnItem;
    
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"iconfont-sousuo"] style:UIBarButtonItemStylePlain target:self action:nil];
    rightBarBtnItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
    
    self.navigationController.navigationBarHidden = NO;
    
}

#pragma mark - 设置书本View
- (void)setBookView
{
    
    int totalColumn = 3;
    CGFloat appW = 90;
    CGFloat appH = 110;
    
    CGFloat marginX = (kScreenW - (totalColumn*appW))/(totalColumn+1);
    CGFloat marginY = 30;
    
    for (int i=0; i<self.datas.count; i++) {
        
        MyBook *bookView = [MyBook bookView];
        [self.view addSubview:bookView];
        
        int row = i/totalColumn;
        int column = i % totalColumn;
        
        CGFloat appX = marginX + column*(marginX+appW);
        CGFloat appY = marginY + row*(marginY+appH);
        
        bookView.frame = CGRectMake(appX, appY, appW, appH);
        
        [bookView setTag:i];
        MyData *data = self.datas[i];
        bookView.data = data;
        
        bookView.bookOpenAction = ^(UIButton *btn){
            [self bookClick:btn];
        };
    }
    
    
    for (int m = 0; m < (self.datas.count / 3) + 1; m++) {
        MyBook *divideView = [MyBook divideView];
        [self.view addSubview:divideView];
        
        divideView.frame = CGRectMake(15, 140 * (m + 1), 345, 8);
    }
}
#pragma mark - 点击菜单button
- (IBAction)menuBtnClick:(UIButton *)sender {
    
    TheBottomAlertView *alert = [[TheBottomAlertView alloc]init];
    [self.view addSubview:alert];
    
    [self.view bringSubviewToFront:alert];
    
    UIButton *closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 373, 40, 40)];
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"button_picview_close_pressed"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [alert addSubview:closeBtn];
    
    _theView = alert;
    UIButton *btn = [_theView viewWithTag:1];
    [btn addTarget:self action:@selector(createChannelView) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 创建导入图书界面
- (void)createChannelView
{
    
    TheChannelViewController *channelVC = [self.storyboard instantiateViewControllerWithIdentifier:@"channelVC"];
    
    [self.navigationController pushViewController:channelVC animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.5 animations:^{
        [_theView removeFromSuperview];
    }];
}

- (void)closeBtnClick
{
    [UIView animateWithDuration:0.5 animations:^{
        [_theView removeFromSuperview];
    }];
}
#pragma mark - 点击书本button
- (void)bookClick:(UIButton *)btn
{
    
    MyReaderViewController *reader = [[MyReaderViewController alloc]init];
    //对txt文件的解码读取
    NSString *filePath = [[NSBundle mainBundle] pathForResource:btn.titleLabel.text ofType:@"txt"];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    //UINICODE编码
    NSString *isUNICODE = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    //ANSI编码
    NSString *isANSI = [[NSString alloc] initWithData:data encoding:-2147482062];
    
    if (isUNICODE) {
        NSString *retStr = [[NSString alloc] initWithCString:[isUNICODE UTF8String] encoding:NSUTF8StringEncoding];
        NSData *UTF16Data = [retStr dataUsingEncoding:NSUTF16StringEncoding];
        NSString *CNStr = [[NSString alloc] initWithData:UTF16Data encoding:NSUTF16StringEncoding];
        str = CNStr;
        
    }else if(isANSI){
        NSData *ANData = [isANSI dataUsingEncoding:NSUTF16StringEncoding];
        NSString *CNStr = [[NSString alloc] initWithData:ANData encoding:NSUTF16StringEncoding];
        str = CNStr;
    }
    
    [reader loadText:str];
    
    [self.navigationController pushViewController:reader animated:YES];
    
}


#pragma mark - 懒加载
- (NSArray *)datas
{
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Book" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            MyData *data = [MyData dataWithDict:dict];
            [models addObject:data];
        }
        _datas = models;
    }
    return _datas;
}

@end
