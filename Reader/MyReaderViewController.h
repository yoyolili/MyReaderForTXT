//
//  PCReaderViewController.h
//  PCReaderDemo
//


/*
 *阅读界面
 */
#import <UIKit/UIKit.h>

@interface MyReaderViewController : UIViewController<UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController *pageController;
@property (nonatomic, strong) UICollectionView *collectionView;
//加载文本
- (void)loadText:(NSString *)text;

@end

@protocol PCFontAdjustViewDelegate <NSObject>
//调整文本区域
- (void)adjustRangeArrayForText;

@end

@interface PCFontAdjustView : UIView
//字体适应
@property (nonatomic, weak) id<PCFontAdjustViewDelegate>delegate;

@property (nonatomic, strong) UIButton *plusButton;
@property (nonatomic, strong) UIButton *minusButton;

@end