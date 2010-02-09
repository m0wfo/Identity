#import "Identity.h"

@implementation Identity

+ (NSString*) getKey:(CFStringRef*) keyName
{
  NSString *key = nil;
  
  io_service_t platformExpert = IOServiceGetMatchingService(kIOMasterPortDefault,
                                                            IOServiceMatching("IOPlatformExpertDevice"));

  if (platformExpert) {
    CFTypeRef keyAsCFString = IORegistryEntryCreateCFProperty(platformExpert, *keyName, kCFAllocatorDefault, 0);
                                       
    if (keyAsCFString) {
      key = (NSString *)keyAsCFString;
    }
  }
  
  IOObjectRelease(platformExpert);
  return key;
}

+ (NSString*) serialNumber
{
  CFStringRef sn = CFSTR(kIOPlatformSerialNumberKey);
  NSString *serial = [self getKey:&sn];
  return serial;
}

+ (NSString*) hardwareUUID
{
  CFStringRef uuid = CFSTR(kIOPlatformUUIDKey);
  NSString *hardwareUUID = [self getKey:&uuid];
  return hardwareUUID;
}

+ (NSString*) hashedID
{
  NSString *sn = [self serialNumber];
  NSString *concat = [sn stringByAppendingString: [self hardwareUUID]];
  return sn;
}

@end

void Init_Identity()
{
}