//
//  PCPageCell.m
//  PCReaderDemo
//


#import "MyPageCell.h"

@implementation MyPageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.pageView];
        //自动布局
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_pageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_pageView)]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_pageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_pageView)]];
    }
    return self;
}

#pragma mark - lazy loading

- (MyPageView *)pageView
{
    if (!_pageView) {
        _pageView = [[MyPageView alloc] init];
        _pageView.translatesAutoresizingMaskIntoConstraints = NO;
        _pageView.backgroundColor = [UIColor whiteColor];
    }
    return _pageView;
}

@end
