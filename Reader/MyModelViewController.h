//
//  PCModelViewController.h
//  PCReaderDemo
//


#import <UIKit/UIKit.h>
#import "MyDataViewController.h"
#import "MyReaderViewController.h"

#define kAdjustFontNotification     @"kAdjustFontNotification"

@interface MyModelViewController : NSObject<UIPageViewControllerDataSource>

@property (weak, nonatomic) MyReaderViewController *readerController;
@property (strong, nonatomic) NSArray *pageData;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSDictionary *attributes;

- (MyDataViewController *)viewControllerAtIndex:(NSUInteger)index;

- (NSUInteger)indexOfViewController:(MyDataViewController *)viewController;

@end
