#import <Cocoa/Cocoa.h>
#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/IOKitLib.h>

@interface Identity : NSObject
{
}

+(NSString*) getKey:(CFStringRef*) keyName;
+(NSString*) serialNumber;
+(NSString*) hardwareUUID;
// +(NSString*) hashedID;
@end