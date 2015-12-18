//
//  PCModelViewController.m
//  PCReaderDemo
//


#import "MyModelViewController.h"
#import "MyGlobalModel.h"

@interface MyModelViewController ()

@end

@implementation MyModelViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        // Create the data model.
    }
    return self;
}

- (MyDataViewController *)viewControllerAtIndex:(NSUInteger)index {
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    MyDataViewController *dataViewController = [[MyDataViewController alloc] init];
    dataViewController.dataObject = [self.text substringWithRange:NSRangeFromString(self.pageData[index])];
    dataViewController.attributes = self.attributes;
    dataViewController.currentPage = index;
    dataViewController.totalPage = [self.pageData count];
    [MyGlobalModel shareModel].currentPage = index;
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(MyDataViewController *)viewController {
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:NSStringFromRange([self.text rangeOfString:viewController.dataObject])];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(MyDataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    [MyGlobalModel shareModel].currentRange = NSRangeFromString(self.pageData[index]);
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(MyDataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    [MyGlobalModel shareModel].currentRange = NSRangeFromString(self.pageData[index]);
    return [self viewControllerAtIndex:index];
}

@end
