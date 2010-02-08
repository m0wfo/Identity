#import <Cocoa/Cocoa.h>
// #import <CommonCrypto/CommonDigest.h>
#include <CoreFoundation/CoreFoundation.h>
#include <IOKit/IOKitLib.h>

@interface Identity : NSObject
{
}

+(NSString*) serialNumber;
+(NSString*) hardwareUUID;
+(NSString*) hashedID;
@end