//
//  PCGlobalModel.h
//  PCReaderDemo
//


#import <UIKit/UIKit.h>

static NSString *kUpdatePageNotification = @"kUpdatePageNotification";

@interface MyGlobalModel : NSObject

@property (nonatomic, strong) NSString *text;//文本
@property (nonatomic, strong) NSMutableArray *rangeArray;
@property (nonatomic, strong) NSDictionary *attributes;
@property (nonatomic) CGFloat fontSize;//字体大小
@property (nonatomic) NSInteger currentPage;
@property (nonatomic) NSRange currentRange;     //尚未使用

+ (instancetype)shareModel;

- (void)loadText:(NSString *)text completion:(void(^)(void))completion;

- (void)updateFontCompletion:(void(^)(void))completion;

@end
