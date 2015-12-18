//
//  PCDataViewController.h
//  PCReaderDemo
//


#import <UIKit/UIKit.h>
#import "MyPageView.h"

@interface MyDataViewController : UIViewController

@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic) NSDictionary *attributes;
@property (strong, nonatomic) MyPageView *pageView;
@property (strong, nonatomic) UILabel *progressLabel;
@property (strong, nonatomic) UILabel *timeLabel;

@property (nonatomic) NSInteger currentPage;
@property (nonatomic) NSInteger totalPage;

@end
