#import <Cocoa/Cocoa.h>
#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/IOKitLib.h>

@interface Identity : NSObject
{
}

+(NSString*) serialNumber;
@end