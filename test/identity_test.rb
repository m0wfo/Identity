# Yeah, I need to formalise these tests.
require File.join(File.expand_path(File.dirname(__FILE__)), "../", "build", "Identity.bundle")

sn = `ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformSerialNumber/ { print $3; }'`[1..-3]
sn_from_identity = Identity.serialNumber
p sn == sn_from_identity

uuid = `ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformUUID/ { print $3; }'`[1..-3]
uuid_from_identity = Identity.hardwareUUID
p uuid == uuid_from_identity