require "test/unit"
require File.join(File.expand_path(File.dirname(__FILE__)), "../", "build", "Identity")

Identity

class IdentityTest < Test::Unit::TestCase
  @@sn = `ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformSerialNumber/ { print $3; }'`[1..-3]
  @@uuid = `ioreg -rd1 -c IOPlatformExpertDevice | awk '/IOPlatformUUID/ { print $3; }'`[1..-3]
  @@hashed_id = @@sn.to_s + @uuid.to_s
  
  def test_sn_returned_is_correct
    sn_from_identity = Identity.serialNumber
    assert_equal(@@sn, sn_from_identity)
  end
  
  def test_uuid_returned_is_correct
    uuid_from_identity = Identity.hardwareUUID
    assert_equal(@@uuid, uuid_from_identity)
  end
  
  def test_hashed_id_concatenates_identifiers
    assert_equal(Identity.hashedID, @@hashed_id)
  end
  
  def test_all_keys_returned_as_ns_strings
    [:serialNumber, :hardwareUUID, :hashedID].each do |m|
      assert Identity.send(m).is_a?(String)
    end
  end
end