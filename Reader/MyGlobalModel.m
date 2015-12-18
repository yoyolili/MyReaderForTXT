//
//  PCGlobalModel.m
//  PCReaderDemo
//


#import "MyGlobalModel.h"
#import "NSString+PCPaging.h"

@implementation MyGlobalModel

+ (instancetype)shareModel
{
    static MyGlobalModel *model = nil;
    static dispatch_once_t predicate;//dispatch_once_t 与dispatch_once一起使用的谓词
    //dispatch_once 将对象一次且仅一次执行应用程序的生命周期
    dispatch_once(&predicate, ^{
        model = [[MyGlobalModel alloc] init];
    });
    return model;
}

- (instancetype)init
{
    /*
     *初始化，设置字体大小为18
     */
    self = [super init];
    if (self) {
        self.fontSize = 18;
    }
    return self;
}

- (void)loadText:(NSString *)text completion:(void (^)(void))completion
{
    self.text = text;
    [self pagingTextCompletion:completion];
}

- (void)pagingTextCompletion:(void (^)(void))completion
{
    //创建并返回一个可容纳5个容量的可变字典
    NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithCapacity:5];
    UIFont * font = [UIFont systemFontOfSize:self.fontSize];
    [attributes setValue:font forKey:NSFontAttributeName];
    [attributes setValue:@(1.0) forKey:NSKernAttributeName];
    
    //段落样式
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5.0;//两行之间的间隔
    paragraphStyle.paragraphSpacing = 10.0;//本段结束之后返回的空间
    paragraphStyle.alignment = NSTextAlignmentJustified;//文本对齐方式
    [attributes setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
    self.attributes = [attributes copy];
    self.rangeArray = [[self.text paginationWithAttributes:self.attributes constrainedToSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 10 * 2, [UIScreen mainScreen].bounds.size.height - 30 * 2)] mutableCopy];
    if (completion) {
        completion();
    }
}

- (void)updateFontCompletion:(void (^)(void))completion
{
    //取回之前的定位页数
    NSRange range = self.currentRange;
    [self pagingTextCompletion:^{
        //重新定位页码
        [self.rangeArray enumerateObjectsUsingBlock:^(NSString *rangeStr, NSUInteger idx, BOOL *stop) {
            NSRange tempRange = NSRangeFromString(rangeStr);
            if (tempRange.location <= range.location && tempRange.location + tempRange.length > range.location) {
                self.currentPage = idx;
                *stop = YES;
            }
        }];
        if (completion) {
            completion();
        }
    }];
}
//设置字体大小
- (void)setFontSize:(CGFloat)fontSize
{
    if (fontSize < 14.0) {
        _fontSize = 14.0;
    } else if (fontSize > 30.0) {
        _fontSize = 30.0;
    } else {
        _fontSize = fontSize;
    }
}
//设置当前点击的坐标
- (void)setCurrentRange:(NSRange)currentRange
{
    _currentRange = currentRange;
    NSLog(@"%@", NSStringFromRange(_currentRange));
}

@end
