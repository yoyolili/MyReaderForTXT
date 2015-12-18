//
//  BookViewController.h
//  Reader
//
//  Created by 阿喵 on 15/11/25.
//  Copyright © 2015年 河南青云. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyData;

@interface BookViewController : UIViewController
@property (nonatomic)NSInteger allPage;
@property (nonatomic)NSInteger currentPage;

@property (nonatomic,strong)NSString *txt;
@property (nonatomic,strong)MyData *data;

@property (nonatomic,strong)UITextView *textView;

@end
