//
//  TheBottomAlertView.m
//  Reader
//
//  Created by 阿喵 on 15/12/14.
//  Copyright © 2015年 河南青云. All rights reserved.
//

#import "TheBottomAlertView.h"

@interface TheBottomAlertView ()

@property (nonatomic, strong)TheBottomAlertView *bottomView;

@end

@implementation TheBottomAlertView

- (instancetype)init
{
    if (self = [super init]) {
        TheBottomAlertView *view = [[TheBottomAlertView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
        view.backgroundColor = [UIColor lightTextColor];
        
        TheBottomAlertView *bottomV = [TheBottomAlertView bottomView];
        bottomV.frame = CGRectMake(0, 423, 375, 200);
        bottomV.backgroundColor = [UIColor clearColor];
        [view addSubview:bottomV];
        _bottomView = bottomV;
    
        self = view;
    }
    return self;
}

+ (instancetype)bottomView
{
    return [[NSBundle mainBundle]loadNibNamed:@"TheBottomAlertView" owner:nil options:nil][0];
}






@end
