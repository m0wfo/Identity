#import "Identity.h"

@implementation Identity

+ (NSString*) serialNumber
{
  NSString *serial = nil;
  
  io_service_t platformExpert = IOServiceGetMatchingService(kIOMasterPortDefault,
                                                            IOServiceMatching("IOPlatformExpertDevice"));

  if (platformExpert) {
    CFTypeRef serialNumberAsCFString = IORegistryEntryCreateCFProperty(platformExpert,
                                       CFSTR(kIOPlatformSerialNumberKey),
                                       kCFAllocatorDefault, 0);
                                       
    if (serialNumberAsCFString) {
      serial = (NSString *)serialNumberAsCFString;
    }
  }
  
  IOObjectRelease(platformExpert);
  return serial;
}

+ (NSString*) hardwareUUID
{
  NSString *serial = nil;
  
  io_service_t platformExpert = IOServiceGetMatchingService(kIOMasterPortDefault,
                                                            IOServiceMatching("IOPlatformExpertDevice"));

  if (platformExpert) {
    CFTypeRef serialNumberAsCFString = IORegistryEntryCreateCFProperty(platformExpert,
                                       CFSTR(kIOPlatformUUIDKey),
                                       kCFAllocatorDefault, 0);
                                       
    if (serialNumberAsCFString) {
      serial = (NSString *)serialNumberAsCFString;
    }
  }
  
  IOObjectRelease(platformExpert);
  return serial; 
}

@end

void Init_Identity()
{
}