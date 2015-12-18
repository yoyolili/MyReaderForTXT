//
//  NSString+PCPaging.m
//  PCReaderDemo
//


#import "NSString+PCPaging.h"
#import <CoreText/CoreText.h>

@implementation NSString (MyPaging)

/**
 * @abstract 根据指定的大小,对字符串进行分页,计算出每页显示的字符串区间(NSRange)
 *
 * @param    attributes  分页所需的字符串样式,需要指定字体大小,行间距等。iOS6.0以上请参见UIKit中NSAttributedString的扩展,iOS6.0以下请参考CoreText中的CTStringAttributes.h
 * @param    size        需要参考的size。即在size区域内
 */
- (NSArray *)paginationWithAttributes:(NSDictionary *)attributes constrainedToSize:(CGSize)size  {
    NSMutableArray *resultRange = [NSMutableArray arrayWithCapacity:5];
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    // 构造NSAttributedString
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:self attributes:attributes];
    
    //    以下方法耗时 基本再 0.5s 以内
    //NSDate *date = [NSDate date];
    NSInteger rangeIndex = 0;
    do {
        //需要根据具体字号对最小值就行分别设定
        unsigned long length = MIN(750, attributedString.length - rangeIndex);
        //NSAttributedString对象管理字符串和属性的关联的集（例如，字体和字距调整）适用于单个字符或字符串的字符的范围。
        NSAttributedString *childString = [attributedString attributedSubstringFromRange:NSMakeRange(rangeIndex, length)];
        
        //__bridge类型转换
        CTFramesetterRef childFramesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef) childString);
        //顶一个矩形区域
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:rect];
        //使用framesetter创建一个不可变的帧
        //参数1:用于创建的框架,参数2:用来创建 framesetter，即在行排版的归因于字符串装到框架,参数3:一个 CGPath 对象，指定框架的形状,参数4:控制框架填充过程的附加属性可以指定在这里，或如果没有这种特性，则为 NULL。
        CTFrameRef frame = CTFramesetterCreateFrame(childFramesetter, CFRangeMake(0, 0), bezierPath.CGPath, NULL);
        //在框架中返回实际上适合的字符的范围。
        CFRange range = CTFrameGetVisibleStringRange(frame);
        NSRange r = {rangeIndex, range.length};
        
        if (r.length > 0) {
            [resultRange addObject:NSStringFromRange(r)];
        }
        rangeIndex += r.length;
        CFRelease(frame);
        CFRelease(childFramesetter);
    } while (rangeIndex < attributedString.length && attributedString.length > 0);
    //NSTimeInterval millionSecond = [[NSDate date] timeIntervalSinceDate:date];
    //NSLog(@"耗时 %@", [NSString stringWithFormat:@"%lf", millionSecond]);
    return resultRange;
}

- (NSString *)halfWidthToFullWidth
{
    //半角转全角
    NSMutableString *convertedString = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)convertedString, NULL, kCFStringTransformHiraganaKatakana, false);
    return [convertedString copy];
}

@end
