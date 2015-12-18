//
//  BookViewController.m
//  Reader
//
//  Created by 阿喵 on 15/11/25.
//  Copyright © 2015年 河南青云. All rights reserved.
//

#import "BookViewController.h"
#import "MyData.h"
@interface BookViewController ()



@end

@implementation BookViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBar];
    
    [self createTextView];
    // Do any additional setup after loading the view.
}
//创建进入书本的阅读view
- (void)createTextView
{
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, 375, 647)];
    [self.view addSubview:textView];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:self.data.name ofType:@"txt"];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    //UINICODE编码
    NSString *isUNICODE = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    //ANSI编码
    NSString *isANSI = [[NSString alloc] initWithData:data encoding:-2147482062];
    
    if (isUNICODE) {
        NSString *retStr = [[NSString alloc] initWithCString:[isUNICODE UTF8String] encoding:NSUTF8StringEncoding];
        NSData *UTF16Data = [retStr dataUsingEncoding:NSUTF16StringEncoding];
        NSString *CNStr = [[NSString alloc] initWithData:UTF16Data encoding:NSUTF16StringEncoding];

        textView.text = CNStr;
        
    }else if(isANSI){
        NSData *ANData = [isANSI dataUsingEncoding:NSUTF16StringEncoding];
        NSString *CNStr = [[NSString alloc] initWithData:ANData encoding:NSUTF16StringEncoding];

        textView.text = CNStr;

    }
    textView.font = [UIFont boldSystemFontOfSize:20];
    textView.textColor = [UIColor blackColor];
    textView.editable = NO;
    
    _textView = textView;
    
    _allPage = _textView.contentSize.height / 647 + 1;
    _currentPage = 1;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [_textView addGestureRecognizer:pan];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    tap.numberOfTapsRequired = 1;
    
    [_textView addGestureRecognizer:tap];
    
}

- (void)click:(UITapGestureRecognizer *)tap
{
    self.navigationController.navigationBarHidden = !YES;
}
- (void)pan:(UIPanGestureRecognizer *)sender
{
    CGPoint point = [sender translationInView:_textView];
    if (point.x < -5 && point.x > -10) {
        [sender setTranslation:CGPointMake(0, 0) inView:_textView];
        [self upPage];
        return;
    }
    
    if (point.x > 5 && point.x < 10) {
        [sender setTranslation:CGPointMake(0, 0) inView:_textView];
        [self downPage];
        return;
    }
    
    return;
    
}

- (void)upPage
{
    if (_currentPage == 1) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"这已经是第一页" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
        return;
    }
    
    _currentPage = _currentPage - 1;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    [_textView setContentOffset:CGPointMake(0, (_currentPage + 1)*647) animated:YES];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    [UIView commitAnimations];
                                            
    return;
}
- (void)downPage
{
    if (_currentPage == _allPage) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"这已经是最后一页" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
        return;
    }
    
    _currentPage = _currentPage + 1;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    [_textView setContentOffset:CGPointMake(0, (_currentPage - 1)*647) animated:YES];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    [UIView commitAnimations];
    return;
    
}

//设置导航栏
- (void)setNavigationBar
{
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"iconfont-fanhui"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    leftBarBtnItem.tintColor = [UIColor lightTextColor];
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
}

//返回
- (void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
