//
//  TheBottomAlertView.h
//  Reader
//
//  Created by 阿喵 on 15/12/14.
//  Copyright © 2015年 河南青云. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TheBottomAlertView : UIView
@property (nonatomic,strong)void(^channelAction)(UIButton *btn);
@property (weak, nonatomic) IBOutlet UIButton *btnSetting;
@property (weak, nonatomic) IBOutlet UIButton *btnIn;


@end
