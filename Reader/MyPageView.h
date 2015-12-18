//
//  PCPageView.h
//  PCPageDemo
//


#import <UIKit/UIKit.h>

@interface MyPageView : UIView

@property (nonatomic, copy) NSAttributedString *attributedText;

- (void)setText:(NSAttributedString *)attributedText;

@end
