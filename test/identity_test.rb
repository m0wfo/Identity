# Yeah, I need to formalise these tests.
require "digest/sha1"
require File.join(File.expand_path(File.dirname(__FILE__)), "../", "build", "Identity")

sn = `ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformSerialNumber/ { print $3; }'`[1..-3]
sn_from_identity = Identity.serialNumber
p sn == sn_from_identity

uuid = `ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformUUID/ { print $3; }'`[1..-3]
uuid_from_identity = Identity.hardwareUUID
p uuid == uuid_from_identity


# p Digest::SHA1.hexdigest(Identity.serialNumber+Identity.hardwareUUID)
p Identity.hashedID