//
//  MyData.h
//  Reader
//


#import <Foundation/Foundation.h>

@interface MyData : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *form;
@property (nonatomic,strong) NSString *size;
@property (nonatomic,strong) NSDate *date;

+ (instancetype)dataWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
