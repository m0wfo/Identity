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

+ (NSString*) hashedID
{
  NSString *sn = [self serialNumber];
  NSString *concat = [sn stringByAppendingString: [self hardwareUUID]];

  // NSData *data = [concat dataUsingEncoding: NSUTF8StringEncoding];
  // 
  // unsigned char hashBytes[CC_SHA1_DIGEST_LENGTH];
  // CC_SHA1([data bytes], [data length], hashBytes);
  // 
  // NSString *aa = [NSString stringWithCString: hashBytes encoding: NSASCIIStringEncoding]; 
  
  return concat;
}

@end

void Init_Identity()
{
}