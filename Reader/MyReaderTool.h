//
//  PCReaderTool.h
//  OJia
//


#import <UIKit/UIKit.h>

typedef void(^BatteryMonitorBlock)(CGFloat batteryLevel);
typedef void(^TimeMonitorBlock)(NSDate *currentDate);

@interface MyReaderTool : NSObject

- (void)startMonitorBatteryWithBlock:(BatteryMonitorBlock)block;

- (void)stopMonitorBattery;

- (void)startMonitorTimeWithBlock:(TimeMonitorBlock)block;

- (void)stopMonitorTime;

@end
