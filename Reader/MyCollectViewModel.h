//
//  PCCollectViewModel.h
//  PCReaderDemo
//


#import <UIKit/UIKit.h>

@interface MyCollectViewModel : NSObject<UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSDictionary *attributes;

@end
