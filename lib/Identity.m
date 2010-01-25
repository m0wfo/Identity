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

// + (NSString*) hashedID
// {
//   NSString *sn = [self serialNumber];
//   NSString *concat = [sn stringByAppendingString: [self hardwareUUID]];
// 
//   NSData *data = [concat dataUsingEncoding: NSASCIIStringEncoding];
// 
//   unsigned char hashBytes[CC_SHA1_DIGEST_LENGTH];
//   CC_SHA1([data bytes], [data length], hashBytes);
//   
//   // NSUInteger *s = sizeof(hashBytes);
//   
//   // NSString *out = [[NSString alloc] initWithCharacters:hashBytes length:s];
//   
//   NSString *aa = [NSString stringWithCString: hashBytes encoding: NSASCIIStringEncoding]; 
//   
//   return aa;
// }

@end

void Init_Identity()
{
}