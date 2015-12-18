//
//  PCPageView.m
//  PCPageDemo
//


#import "MyPageView.h"
#import <CoreText/CoreText.h>

@implementation MyPageView

- (void)setText:(NSAttributedString *)attributedText
{
    self.attributedText = attributedText;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    // 返回当前文本
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置当前的文本矩阵
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    //更改用户的上下文中的坐标系统的原点
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    //更改用户的上下文中的坐标系统的规模。
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CTFramesetterRef childFramesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self.attributedText);
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRect:rect];
    CTFrameRef frame = CTFramesetterCreateFrame(childFramesetter, CFRangeMake(0, 0), bezierPath.CGPath, NULL);
    CTFrameDraw(frame, context);
    CFRelease(frame);
    CFRelease(childFramesetter);
}

@end
