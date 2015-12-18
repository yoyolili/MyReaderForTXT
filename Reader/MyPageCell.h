//
//  PCPageCell.h
//  PCReaderDemo
//


#import <UIKit/UIKit.h>
#import "MyPageView.h"

static NSString *PageCellIdentifier = @"PageCellIdentifier";

@interface MyPageCell : UICollectionViewCell

@property (nonatomic, strong) MyPageView *pageView;

@end
