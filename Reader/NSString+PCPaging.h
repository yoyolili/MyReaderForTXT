//
//  NSString+PCPaging.h
//  PCReaderDemo
//


/*
 *委托
 */
#import <UIKit/UIKit.h>

@interface NSString (MyPaging)

- (NSArray *)paginationWithAttributes:(NSDictionary *)attributes constrainedToSize:(CGSize)size;

- (NSString *)halfWidthToFullWidth;

@end
