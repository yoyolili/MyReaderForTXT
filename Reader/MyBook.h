//
//  MyBook.h
//  Reader
//


#import <UIKit/UIKit.h>

@class MyData;

@interface MyBook : UIView

@property (nonatomic,strong)void(^bookOpenAction)(UIButton *btn);
@property (nonatomic,strong)MyData *data;

+ (instancetype)bookView;

+ (instancetype)divideView;

@end
